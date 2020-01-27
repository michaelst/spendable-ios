//
//  BudgetView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BudgetView: View {
    @ObservedObject var budget: Budget
    
    var body: some View {
        Form {
            Section {
                NavigationLink(destination: EditBudgetNameView(budget: budget)) {
                    HStack {
                        Text("Name").foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text(budget.name).multilineTextAlignment(.trailing)
                    }
                }
                
                NavigationLink(destination: EditBudgetBalanceView(budget: budget)) {
                    HStack {
                        Text("Balance").foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text("$" + String(format: "%.2f", budget.balance.doubleValue)).multilineTextAlignment(.trailing)
                    }
                }
                
                NavigationLink(destination: EditBudgetGoalView(budget: budget)) {
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
    }
}