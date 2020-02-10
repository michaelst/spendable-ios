//
//  BankAccount.swift
//  Spendable
//
//  Created by Michael St Clair on 11/4/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine

class BankAccount: ObservableObject, Identifiable {
    let objectWillChange = ObservableObjectPublisher()
    let apollo = Apollo()
    
    let id: String
    
    var name: String { willSet { self.objectWillChange.send() } }
    var balance: String { willSet { self.objectWillChange.send() } }
    
    var sync: Bool {
        willSet { self.objectWillChange.send() }
        didSet { self.save() }
    }
    
    init(id: String, name: String, sync: Bool, balance: String) {
        self.id = id
        self.name = name
        self.sync = sync
        self.balance = balance
    }
    
    func save() {
        apollo.client.perform(mutation: UpdateBankAccountMutation(id: id, sync: sync))
    }
}
