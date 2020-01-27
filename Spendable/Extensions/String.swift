//
//  String.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation

extension String {
    struct Number {
        static let formatter = NumberFormatter()
    }
    
    var doubleValue: Double {
        return Number.formatter.number(from: self)?.doubleValue ?? 0
    }
}
