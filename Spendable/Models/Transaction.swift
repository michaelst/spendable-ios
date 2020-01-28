//
//  Transaction.swift
//  Spendable
//
//  Created by Michael St Clair on 11/7/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine
import Apollo

class Transaction: ObservableObject, Identifiable {
    
    init(id: String, name: String? = nil, note: String? = nil, amount: Double, date: Date, categoryId: String? = nil, budgetId: String? = nil) {
        self.id = id
        self.name = name
        self.note = note
        self.amount = amount
        self.date = date
        self.categoryId = categoryId
        self.budgetId = budgetId
    }
    
    let objectWillChange = ObservableObjectPublisher()
    let apollo = Apollo()
    
    let id: String
    
    var name: String? {
        willSet { self.objectWillChange.send() }
        didSet { self.save() }
    }
    
    var nameBinding: String {
        get {
            return self.name ?? ""
        }
        set {
            self.name = newValue.isEmpty ? nil : newValue
        }
    }
    
    var note: String? {
        willSet { self.objectWillChange.send() }
        didSet { self.save() }
    }
    
    var noteBinding: String {
        get {
            return self.note ?? ""
        }
        set {
            self.note = newValue.isEmpty ? nil : newValue
        }
    }
    
    var amount: Double {
        willSet { self.objectWillChange.send() }
        didSet { self.save() }
    }
    
    var date: Date {
        willSet { self.objectWillChange.send() }
        didSet { self.save() }
    }
    
    var budgetId: String? {
        willSet { self.objectWillChange.send() }
        didSet { self.save() }
    }
    
    var categoryId: String? {
        willSet { self.objectWillChange.send() }
        didSet { self.save() }
    }
        
    func save() {
        apollo.client.perform(mutation: UpdateTransactionMutation(id: id, name: name, note: note, categoryId: categoryId, budgetId: budgetId))
    }
}
