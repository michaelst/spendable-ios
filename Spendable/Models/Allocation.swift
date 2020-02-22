//
//  Allocation.swift
//  Spendable
//
//  Created by Michael St Clair on 2/1/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine

class Allocation: ObservableObject, Identifiable, Budgetable {
    let objectWillChange = ObservableObjectPublisher()
    
    let id: String
    var amount: String { willSet { self.objectWillChange.send() } }
    var budgetId: String { willSet { self.objectWillChange.send() } }
    
    var amountBinding: String {
        get {
            return self.amount.removePrefix("-")
        }
        set {
            self.amount = amount.doubleValue < 0 ? "-\(newValue)" : newValue
        }
    }

    init(id: String, amount: String, budgetId: String) {
        self.id = id
        self.amount = amount
        self.budgetId = budgetId
    }
}
