//
//  AllocationTemplateLines.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine

class AllocationTemplateLine: ObservableObject, Identifiable, Budgetable {
    let objectWillChange = ObservableObjectPublisher()
    
    let id: String?
    var amount: String { willSet { self.objectWillChange.send() } }
    var budgetId: String { willSet { self.objectWillChange.send() } }

    init(id: String? = nil, amount: String, budgetId: String) {
        self.id = id
        self.amount = amount
        self.budgetId = budgetId
    }
}
