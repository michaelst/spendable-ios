//
//  User.swift
//  Spendable
//
//  Created by Michael St Clair on 11/4/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine

class User: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var spendable: String { willSet { self.objectWillChange.send() } }
    var bankLimit: Int { willSet { self.objectWillChange.send() } }
    
    init(spendable: String, bankLimit: Int = 0) {
        self.spendable = spendable
        self.bankLimit = bankLimit
    }
}
