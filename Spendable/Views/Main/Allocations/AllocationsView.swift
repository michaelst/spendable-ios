//
//  AllocationsView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/1/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationsView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var transaction: Transaction
    @State private var spendableAmount: Double = 0
    
    var body: some View {
        List {
            Section(footer: AllocationsFooterView(transaction: transaction)) {
                HStack {
                    Text("Spendable")
                    
                    Spacer()
                    
                    Text("$" + String(format: "%.2f", spendableAmount as Double))
                }.padding(.vertical)
                
                ForEach(transaction.allocations) { allocation in
                    AllocationRowView(allocation: allocation)
                }.onDelete(perform: transaction.deleteAllocations)
            }
        }
        .onAppear(perform: { self.spendableAmount = self.transaction.spendableAmount() })
        .navigationBarTitle("Budgets")
    }
}

struct AllocationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AllocationsView(
                transaction: Transaction(
                    id: "1",
                    negative: true,
                    name: "Expense",
                    amount: "25.24",
                    date: Date(),
                    allocations: []
                )
            )
        }
    }
}

struct AllocationsFooterView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var transaction: Transaction
    @State var showTemplates = false
    
    var body: some View {
        HStack {
            NavigationLink(destination: CreateAllocationView(transaction: transaction)) {
                Text("Add budget")
            }
            
            Spacer()
            
            Button(action: { self.showTemplates.toggle() }) {
                if transaction.allocations.count == 0 {
                    Text("Apply template")
                }
            }.sheet(isPresented: $showTemplates) {
                AllocationsView(transaction: self.transaction).environmentObject(self.userData)
            }
        }
    }
}
