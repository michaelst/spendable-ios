//
//  CreateAllocationView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/1/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CreateAllocationView: View {
    @ObservedObject var transaction: Transaction
    @ObservedObject var allocation: Allocation
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(transaction: Transaction) {
        self.transaction = transaction
        
        let spendable = transaction.allocations.map({ $0.amount.doubleValue }).reduce(transaction.amount.doubleValue, -)
        
        self.allocation = Allocation(id: "temp-" + UUID().uuidString, amount: String(format: "%.2f", spendable), budgetId: "")
    }
    
    var body: some View {
        AllocationFormView(allocation: allocation)
            .navigationBarItems(
                leading:
                Button("Cancel", action: {
                    self.presentationMode.wrappedValue.dismiss()
                }),
                trailing:
                Button("Add", action: {
                    self.transaction.allocations.append(self.allocation)
                    self.presentationMode.wrappedValue.dismiss()
                }).disabled(self.allocation.amount.doubleValue == 0 || self.allocation.budgetId.isEmpty)
        )
    }
}
