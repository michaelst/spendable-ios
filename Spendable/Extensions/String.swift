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
    
    var currencyValue: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = .current
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: NSNumber(value: self.doubleValue)) ?? ""
    }
    
    func removePrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
