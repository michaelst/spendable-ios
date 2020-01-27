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
    
    var name: String {
        willSet { self.objectWillChange.send() }
        didSet { self.save() }
    }
    
    var balance: String {
        willSet { self.objectWillChange.send() }
        didSet { self.save() }
    }
    
    var goal: String? {
        willSet { self.objectWillChange.send() }
        didSet { self.save() }
    }
    
    var goalBinding: String {
        get {
            return self.goal ?? ""
        }
        set {
            self.goal = newValue.isEmpty ? nil : newValue
        }
    }
    
    init(id: String, name: String, balance: String, goal: String? = nil) {
        self.id = id
        self.name = name
        self.balance = balance
        self.goal = goal
    }
    
    private func save() {
        let apollo = Apollo()
        apollo.client.perform(mutation: UpdateBugdetMutation(id: id, name: name, balance: balance, goal: goal))
    }
}
