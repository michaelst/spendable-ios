//
//  BankMember.swift
//  Spendable
//
//  Created by Michael St Clair on 11/4/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine

class BankMember: ObservableObject, Identifiable {
    let objectWillChange = ObservableObjectPublisher()
    
    let id: String
    
    var name: String {
        willSet { self.objectWillChange.send() }
    }
    
    var status: String? {
        willSet { self.objectWillChange.send() }
    }
    
    var bankAccounts: [BankAccount] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    init(id: String, name: String, status: String?, bankAccounts: [BankAccount]) {
        self.id = id
        self.name = name
        self.status = status
        self.bankAccounts = bankAccounts
    }
}
