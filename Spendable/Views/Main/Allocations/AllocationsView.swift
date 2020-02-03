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
            return transaction.allocations.map { allocation in
                return allocation.amount.doubleValue
            }.reduce(transaction.amount.doubleValue, -)
        }
    }
    
    var body: some View {
        List {
            Section(footer: AllocationsFooterView(transaction: transaction)) {
                HStack {
                    Text("Spendable")
                    
                    Spacer()
                    
                    Text("$" + String(format: "%.2f", spendableAmount))
                }.padding(.vertical)
                
                ForEach(transaction.allocations) { allocation in
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
            return Allocation(amount: line.amount, budgetId: line.budgetId)
        }
        
        transaction.allocations.append(contentsOf: allocations)
        showTemplates = false
    }
    
    var body: some View {
        HStack {
            NavigationLink(destination: CreateAllocationView(transaction: transaction)) {
                Text("Add budget")
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
        }.onAppear(perform: { self.userData.loadAllocationTemplates() })
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
