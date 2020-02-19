//
//  BudgetData.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI
import Combine

extension UserData  {
    func loadBudgets() {
        apollo.client.fetch(query: ListBudgetsQuery()) { result in
            guard let data = try? result.get().data else { return }
            self.load(data: data)
        }
    }
    
    func load(data: ListBudgetsQuery.Data) {
        var budgetsFromData: [Budget] = []
        
        for budgetData in data.budgets ?? [] {
            if let id = budgetData?.id, let name = budgetData?.name, let balance = budgetData?.balance {
                let budget = Budget(id: id, name: name, balance: balance, goal:budgetData?.goal)
                budgetsFromData.append(budget)
            }
        }
        
        budgets = budgetsFromData
    }
    
    func loadBudgetDetails(budget: Budget) {
        apollo.client.fetch(query: GetBudgetQuery(id: budget.id)) { result in
            guard let data = try? result.get().data?.budget else { return }
            let recentBudgetAllocations: [RecentBudgetAllocation]? = data.recentAllocations?.map { allocation in
                let date = self.dateFormatter.date(from: allocation!.transaction!.date!)
                
                return RecentBudgetAllocation(
                    id: allocation!.id!,
                    name: allocation!.transaction?.name ?? "",
                    amount: allocation!.amount!,
                    date: date!,
                    pending: allocation!.transaction!.bankTransaction?.pending ?? false
                )
            }
            
            budget.recentAllocations = recentBudgetAllocations ?? []
            
            let allocationTemplateLines: [BudgetAllocationTemplateLine]? = data.allocationTemplateLines?.map { line in
                return BudgetAllocationTemplateLine(
                    id: line!.id!,
                    name: line!.allocationTemplate?.name ?? "",
                    amount: line!.amount!
                )
            }
            
            budget.allocationTemplateLines = allocationTemplateLines ?? []
        }
    }
    
    func create(draftBudget: Budget) {
        let mutation = CreateBudgetMutation(name: draftBudget.name, balance: draftBudget.balance, goal: draftBudget.goal)
        
        apollo.client.perform(mutation: mutation) { result in
            guard let data = try? result.get().data?.createBudget else { return }
            if let id = data.id, let name = data.name, let balance = data.balance {
                let budget = Budget(id: id, name: name, balance: balance, goal: data.goal)
                self.budgets.append(budget)
                self.apollo.client.clearCache()
            }
        }
    }
    
    func update(budget: Budget) {
        let mutation = UpdateBudgetMutation(id: budget.id, name: budget.name, balance: budget.balance, goal: budget.goal)
        
        apollo.client.perform(mutation: mutation) { _result in          
            self.apollo.client.clearCache()
        }
    }
    
    func deleteBudgets(at offsets: IndexSet) {
        let dispatch = DispatchGroup()
        
        for offset in Array(offsets) {
            dispatch.enter()
            
            apollo.client.perform(mutation: DeleteBudgetMutation(id: sortedBudgets[offset].id)) { _result in
                dispatch.leave()
            }
        }
        
        dispatch.notify(queue: .main) {
            let unsoretdOffsets = IndexSet(offsets.compactMap {offset in
                self.budgets.firstIndex(where: {line in
                    self.sortedBudgets[offset].id == line.id
                })
            })
            
            self.budgets.remove(atOffsets: unsoretdOffsets)
            self.apollo.client.clearCache()
        }
    }
    
    func deleteGoals(at offsets: IndexSet) {
        let dispatch = DispatchGroup()
        
        for offset in Array(offsets) {
            dispatch.enter()
            
            apollo.client.perform(mutation: DeleteBudgetMutation(id: sortedGoals[offset].id)) { _result in
                dispatch.leave()
            }
        }
        
        dispatch.notify(queue: .main) {
            let unsoretdOffsets = IndexSet(offsets.compactMap {offset in
                self.budgets.firstIndex(where: {line in
                    self.sortedGoals[offset].id == line.id
                })
            })
            
            self.budgets.remove(atOffsets: unsoretdOffsets)
            self.apollo.client.clearCache()
        }
    }
}
