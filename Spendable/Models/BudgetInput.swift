//
//  BudgetInput.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine

class BudgetInput: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var name: String = "" { willSet { self.objectWillChange.send() } }
    var balance: String = "0.00" { willSet { self.objectWillChange.send() } }
    var goal: String? { willSet { self.objectWillChange.send() } }
    
    var goalBinding: String {
        get {
            return self.goal ?? ""
        }
        set {
            self.goal = newValue.isEmpty ? nil : newValue
        }
    }
    
    func clear() {
        name = ""
        balance = "0.00"
        goal = nil
    }
}
