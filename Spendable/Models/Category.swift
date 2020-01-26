//
//  Category.swift
//  Spendable
//
//  Created by Michael St Clair on 11/8/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation

struct Category: Identifiable {
    let id: String
    var name: String
    var parentName: String?
}
