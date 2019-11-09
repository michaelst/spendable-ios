//
//  BankMember.swift
//  Spendable
//
//  Created by Michael St Clair on 11/4/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation

struct BankMember: Codable, Identifiable {
    let id: String
    var name: String
    var status: String?
    var bankAccounts: [BankAccount] = []
}
