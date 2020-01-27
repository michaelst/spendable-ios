//
//  BankAccount.swift
//  Spendable
//
//  Created by Michael St Clair on 11/4/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation

struct BankAccount: Codable, Identifiable {
    let id: String
    var name: String
    var sync: Bool {
        didSet {
            let apollo = Apollo()
            apollo.client.perform(mutation: UpdateBankAccountMutation(id: id, sync: sync))
        }
    }
}
