//
//  BudgetView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BudgetView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var budget: Budget
    @State var draftBudget: Budget = Budget(id: "draft")
    
    private func setDraftValues() {
        draftBudget.name = budget.name
        draftBudget.balance = budget.balance
        draftBudget.goal = budget.goal
    }
    
    private func setValues() {
        budget.name = draftBudget.name
        budget.balance = draftBudget.balance
        budget.goal = draftBudget.goal
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    HStack {
                        Text("Balance")
                        
                        Spacer()
                        
                        Text(budget.balance.currencyValue).foregroundColor(.secondary)
                    }
                    
                    if budget.goal != nil {
                        HStack {
                            Text("Goal")
                            
                            Spacer()
                            
                            Text(budget.goal!).foregroundColor(.secondary)
                        }
                    }
                }
                
                if budget.allocationTemplateLines.count > 0 {
                    Section(header: Text("Templates")) {
                        ForEach(budget.allocationTemplateLines, id: \.id) { line in
                            HStack {
                                Text(line.name)
                                Spacer()
                                Text(line.amount.currencyValue).foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                if budget.recentAllocations.count > 0 {
                    Section(header: Text("Recent Transactions")) {
                        ForEach(budget.recentAllocations, id: \.id) { allocation in
                            RecentBudgetAllocationRowView(allocation: allocation)
                        }
                    }
                }
            }
            .onAppear(perform: {
                self.setDraftValues()
                self.userData.loadBudgetDetails(budget: self.budget)
            })
                .navigationBarTitle(budget.name)
                .navigationBarItems(trailing: NavigationLink("Edit", destination: BudgetFormView(draftBudget: draftBudget, onSave: {
                    self.setValues()
                    self.userData.update(budget: self.budget)
                })))
        }        
    }
}
