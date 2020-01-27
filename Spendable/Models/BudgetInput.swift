//
//  BudgetInput.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine

class BudgetInput: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var name: String = "" {
        willSet { self.objectWillChange.send() }
    }
    
    var balance: String = "0" {
        willSet { self.objectWillChange.send() }
    }
    
    var goal: String? {
        willSet { self.objectWillChange.send() }
    }
    
    var goalBinding: String {
        get {
            return self.goal ?? ""
        }
        set {
            self.goal = newValue.isEmpty ? nil : newValue
        }
    }
    
    func save(budgetData: BudgetData) {
        let apollo = Apollo()
        apollo.client.perform(mutation: CreateBudgetMutation(name: name, balance: balance, goal: goal)) { result in
            guard let data = try? result.get().data?.createBudget else { return }
            if let id = data.id, let name = data.name, let balance = data.balance {
                let budget = Budget(id: id, name: name, balance: balance, goal: data.goal)
                budgetData.budgets.append(budget)
            }
        }
    }
    
    func clear() {
        name = ""
        balance = "0"
        goal = nil
    }
}
