//
//  BudgetData.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI
import Combine

final class BudgetData: ObservableObject  {
    let objectWillChange = ObservableObjectPublisher()
    let apollo = Apollo()
    
    var budgets: [Budget] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    func load() {
        apollo.client.fetch(query: ListBudgetsQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            guard let data = try? result.get().data else { return }
            self.processData(data: data)
        }
    }
    
    private func processData(data: ListBudgetsQuery.Data) {
        var list: [Budget] = []
        
        for budgetData in data.budgets ?? [] {
            if let id = budgetData?.id, let name = budgetData?.name, let balance = budgetData?.balance {
                let budget = Budget(id: id, name: name, balance: balance, goal:budgetData?.goal)
                list.append(budget)
            }
        }
        
        budgets = list
    }
}
