//
//  AllocationsView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/1/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationsView: View {
    @ObservedObject var transaction: Transaction
    @State private var spendableAmount: Double = 0
    
    var body: some View {
        Section {
            List {
                HStack {
                    Text("Spendable")
                    
                    Spacer()
                    
                    Text("$" + String(format: "%.2f", spendableAmount as Double))
                }.padding(.vertical)
                
                ForEach(transaction.allocations) { allocation in
                    AllocationRowView(allocation: allocation)
                }.onDelete(perform: transaction.deleteAllocations)
            }
            .listStyle(GroupedListStyle())
        }
        .onAppear(perform: { self.spendableAmount = self.transaction.spendableAmount() })
        .navigationBarTitle("Allocations")
        .navigationBarItems(trailing:
            NavigationLink(destination: CreateAllocationView(transaction: transaction)) {
                Image(systemName: "plus.circle").font(.system(size: 24, weight: .regular))
            }
        )
    }
}
