//
//  Budget.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine

class Budget: ObservableObject, Identifiable {    
    let objectWillChange = ObservableObjectPublisher()
    
    let id: String
    var name: String { willSet { self.objectWillChange.send() } }
    var balance: String { willSet { self.objectWillChange.send() } }
    var goal: String? { willSet { self.objectWillChange.send() } }
    
    var goalBinding: String {
        get {
            return self.goal ?? ""
        }
        set {
            self.goal = newValue.isEmpty ? nil : newValue
        }
    }
    
    var recentAllocations: [RecentBudgetAllocation] = [] { willSet { self.objectWillChange.send() } }
    
    init(
        id: String,
        name: String,
        balance: String,
        goal: String? = nil,
        recentAllocations: [RecentBudgetAllocation] = []
    ) {
        self.id = id
        self.name = name
        self.balance = balance
        self.goal = goal
        self.recentAllocations = recentAllocations
    }
}
