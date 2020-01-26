//
//  BudgetView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BudgetView: View {
    @EnvironmentObject var data: BudgetData
    
    var budgetId: String
    
    private var budget: Budget {
        get {
            return data.budgets[budgetId]!
        }
    }
    
    var body: some View {
        Form {
            Section {
                NavigationLink(destination: EditBudgetNameView(budgetId: budgetId)) {
                    HStack {
                        Text("Name").foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text(budget.name).multilineTextAlignment(.trailing)
                    }
                }
                
                NavigationLink(destination: EditBudgetBalanceView(budgetId: budgetId)) {
                    HStack {
                        Text("Balance").foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text("$" + String(format: "%.2f", budget.balance)).multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}
