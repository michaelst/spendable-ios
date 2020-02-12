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
    let negative: Bool
    var pending: Bool
    var name: String? { willSet { self.objectWillChange.send() } }
    var note: String? { willSet { self.objectWillChange.send() } }
    var bankMemo: String? { willSet { self.objectWillChange.send() } }
    var amount: String {
        willSet { self.objectWillChange.send() }
        didSet { amount = amount.removePrefix("-")}
    }
    var date: Date { willSet { self.objectWillChange.send() } }
    var allocations: [Allocation] = [] { willSet { self.objectWillChange.send() } }
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
    
    init(id: String, pending: Bool, name: String? = nil, note: String? = nil, bankMemo: String? = nil, amount: String, date: Date, categoryId: String? = nil, allocations: [Allocation] = []) {
        self.id = id
        self.pending = pending
        self.negative = amount.hasPrefix("-")
        self.name = name
        self.note = note
        self.bankMemo = bankMemo
        self.amount = amount.removePrefix("-")
        self.date = date
        self.categoryId = categoryId
        self.allocations = allocations
    }
    
    func deleteAllocations(at offsets: IndexSet) {
        let sortedAllocations = allocations.sorted(by: { $0.amount.doubleValue > $1.amount.doubleValue })
        let unsoretdOffsets = IndexSet(offsets.compactMap {offset in
            allocations.firstIndex(where: {line in
                sortedAllocations[offset].id == line.id
            })
        })
        
        allocations.remove(atOffsets: unsoretdOffsets)
    }
}
