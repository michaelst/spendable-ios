//
//  Transaction.swift
//  Spendable
//
//  Created by Michael St Clair on 11/7/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation

struct Transaction: Identifiable {
    let id: String
    var name: String?
    var note: String?
    var amount: Float
    var date: Date
    var category: Category?
}
