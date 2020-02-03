//
//  AllocationTemplate.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine

class AllocationTemplate: ObservableObject, Identifiable {
    let objectWillChange = ObservableObjectPublisher()
    
    var id: String
    var name: String { willSet { self.objectWillChange.send() } }
    var lines: [AllocationTemplateLine] = [] { willSet { self.objectWillChange.send() } }
    
    init(id: String, name: String, lines: [AllocationTemplateLine] = []) {
        self.id = id
        self.name = name
        self.lines = lines
    }
    
    var budgeted: Double {
        get {
            lines.map { line in
                return line.amount.doubleValue
            }.reduce(0, +)
        }
    }
    
    func deleteLines(at offsets: IndexSet) {
        lines.remove(atOffsets: offsets)
    }
}
