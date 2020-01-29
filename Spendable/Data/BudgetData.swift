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
            self.processData(data: data)
        }
    }
    
    func create(budgetInput: BudgetInput) {
        apollo.client.perform(mutation: CreateBudgetMutation(name: budgetInput.name, balance: budgetInput.balance, goal: budgetInput.goal)) { result in
            guard let data = try? result.get().data?.createBudget else { return }
            if let id = data.id, let name = data.name, let balance = data.balance {
                let budget = Budget(id: id, name: name, balance: balance, goal: data.goal)
                self.budgets.append(budget)
                self.apollo.client.clearCache()
            }
        }
    }
    
    func update(budget: Budget, budgetInput: BudgetInput) {
        apollo.client.perform(mutation: UpdateBudgetMutation(id: budget.id, name: budgetInput.name, balance: budgetInput.balance, goal: budgetInput.goal)) { result in
            guard let data = try? result.get().data?.updateBudget else { return }
            
            budget.name = data.name!
            budget.balance = data.balance!
            budget.goal = data.goal

            self.apollo.client.clearCache()
        }
    }
    
    func deleteBudgets(at offsets: IndexSet) {
        for offset in Array(offsets) {
            apollo.client.perform(mutation: DeleteBudgetMutation(id: budgets[offset].id)) { result in
                self.apollo.client.clearCache()
            }
        }
        
        budgets.remove(atOffsets: offsets)
    }
    
    private func processData(data: ListBudgetsQuery.Data) {
        var budgetsFromData: [Budget] = []
        
        for budgetData in data.budgets ?? [] {
            if let id = budgetData?.id, let name = budgetData?.name, let balance = budgetData?.balance {
                let budget = Budget(id: id, name: name, balance: balance, goal:budgetData?.goal)
                budgetsFromData.append(budget)
            }
        }
        
        budgets = budgetsFromData
    }
}
