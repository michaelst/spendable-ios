//
//  Transaction.swift
//  Spendable
//
//  Created by Michael St Clair on 11/7/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine

class Transaction: ObservableObject, Identifiable {    
    let objectWillChange = ObservableObjectPublisher()
    
    let id: String
    var name: String? { willSet { self.objectWillChange.send() } }
    var note: String? { willSet { self.objectWillChange.send() } }
    var amount: String { willSet { self.objectWillChange.send() } }
    var date: Date { willSet { self.objectWillChange.send() } }
    var budgetId: String? { willSet { self.objectWillChange.send() } }
    var categoryId: String? { willSet { self.objectWillChange.send() } }
    
    var nameBinding: String {
        get {
            return self.name ?? ""
        }
        set {
            self.name = newValue.isEmpty ? nil : newValue
        }
    }
    
    var noteBinding: String {
        get {
            return self.note ?? ""
        }
        set {
            self.note = newValue.isEmpty ? nil : newValue
        }
    }
    
    init(id: String, name: String? = nil, note: String? = nil, amount: String, date: Date, categoryId: String? = nil, budgetId: String? = nil) {
        self.id = id
        self.name = name
        self.note = note
        self.amount = amount
        self.date = date
        self.categoryId = categoryId
        self.budgetId = budgetId
    }
}
