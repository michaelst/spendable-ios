//
//  CreateBudgetView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CreateBudgetView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var budget: BudgetInput = BudgetInput()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Form {
            Section {
                NavigationLink(destination: CreateBudgetNameView(budget: budget)) {
                    HStack {
                        Text("Name").foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text(budget.name).multilineTextAlignment(.trailing)
                    }
                }
                
                NavigationLink(destination: CreateBudgetBalanceView(budget: budget)) {
                    HStack {
                        Text("Balance").foregroundColor(.secondary)
                
                        Spacer()
                
                        Text("$" + String(format: "%.2f", budget.balance.doubleValue)).multilineTextAlignment(.trailing)
                    }
                }
                
                NavigationLink(destination: CreateBudgetGoalView(budget: budget)) {
                    HStack {
                        Text("Goal").foregroundColor(.secondary)
                
                        Spacer()
                
                        if budget.goal != nil {
                            Text("$" + String(format: "%.2f", budget.goal!.doubleValue)).multilineTextAlignment(.trailing)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Create budget")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
            Button("Cancel", action: {
                self.budget.clear()
                self.presentationMode.wrappedValue.dismiss()
            }),
            trailing:
            Button("Add", action: {
                self.userData.create(budgetInput: self.budget)
                self.presentationMode.wrappedValue.dismiss()
            })
        )
    }
}
