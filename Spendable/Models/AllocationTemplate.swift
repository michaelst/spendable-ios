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
    
    func deleteLines(at offsets: IndexSet) {
        let sortedLines = lines.sorted(by: { $0.amount.doubleValue > $1.amount.doubleValue })
        let unsoretdOffsets = IndexSet(offsets.compactMap {offset in
            lines.firstIndex(where: {line in
                sortedLines[offset].id == line.id
            })
        })
        
        lines.remove(atOffsets: unsoretdOffsets)
    }
}
