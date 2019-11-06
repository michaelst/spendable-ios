//
//  BankAccount.swift
//  Spendable
//
//  Created by Michael St Clair on 11/4/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation

struct BankAccount: Codable, Identifiable {
    var id: String
    var name: String
    var sync: Bool {
        willSet {
            print("sync status will change")
        }
    }
}
