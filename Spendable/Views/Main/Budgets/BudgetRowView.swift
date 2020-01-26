//
//  BudgetRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BudgetRowView: View {
    @EnvironmentObject var data: BudgetData
    
    var budgetId: String
    
    private var budget: Budget {
        get {
            return data.budgets[budgetId]!
        }
    }
    
    var body: some View {
        NavigationLink(destination: BudgetView(budgetId: budgetId)) {
            HStack {
                Text(budget.name).lineLimit(1)
                
                Spacer()
                
                if budget.balance < 0 {
                    Text("$" + String(format: "%.2f", abs(budget.balance))).foregroundColor(.red)
                } else {
                    Text("$" + String(format: "%.2f", budget.balance))
                }
            }
        }.padding(.vertical)
    }
}
