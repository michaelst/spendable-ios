//
//  Double.swift
//  Spendable
//
//  Created by Michael St Clair on 2/23/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation

extension Double {    
    var currencyValue: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = .current
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
