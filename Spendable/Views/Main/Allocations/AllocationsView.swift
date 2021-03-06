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
    
    var spendableAmount: Double {
        get {
            return transaction.allocations.map({ $0.amount.doubleValue }).reduce(transaction.amount.doubleValue, -)
        }
    }
    
    var body: some View {
        List {
            Section(footer: AllocationsFooterView(transaction: transaction)) {
                if spendableAmount != 0 {
                    HStack {
                        Text("Spendable")
                        
                        Spacer()
                        
                        Text(spendableAmount.currencyValue)
                    }.padding(.vertical)
                }
                
                ForEach(transaction.allocations.sorted { $0.amount.doubleValue > $1.amount.doubleValue}) { allocation in
                    AllocationRowView(allocation: allocation)
                }.onDelete(perform: transaction.deleteAllocations)
            }
        }
        .navigationBarTitle("Budgets")
    }
}

struct AllocationsFooterView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var transaction: Transaction
    @State var showTemplates = false
    
    private func onSelect(templateId: String) {
        let template = userData.allocationTemplatesById[templateId]
        
        let allocations = template!.lines.map { line in
            return Allocation(id: "temp-" + UUID().uuidString, amount: line.amount, budgetId: line.budgetId)
        }
        
        transaction.allocations.append(contentsOf: allocations)
        showTemplates = false
    }
    
    var body: some View {
        HStack {
            NavigationLink(destination: CreateAllocationView(transaction: transaction)) {
                Text("Split")
            }
            
            Spacer()
            
            Button("Apply template", action: { self.showTemplates.toggle() })
                .sheet(isPresented: $showTemplates) {
                    AllocationTemplateSelector(onSelect: self.onSelect).environmentObject(self.userData)
            }
        }
    }
}

struct AllocationTemplateSelector: View {
    @EnvironmentObject var userData: UserData
    var onSelect: (String) -> ()
    
    var body: some View {
        Section {
            List {
                ForEach(userData.allocationTemplates) { template in
                    AllocationTemplateRowView(template: template)
                        .onTapGesture { self.onSelect(template.id) }
                }
            }.listStyle(GroupedListStyle())
        }
    }
}

struct AllocationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AllocationsView(
                transaction: Transaction(
                    id: "1",
                    pending: false,
                    name: "Expense",
                    amount: "25.24",
                    date: Date(),
                    allocations: []
                )
            )
        }
    }
}
