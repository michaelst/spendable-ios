//
//  Budget.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation

struct Budget: Codable, Identifiable {
    let id: String
    var name: String
    var balance: Double
    var goal: Double?
}
