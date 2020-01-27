//
//  BudgetRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BudgetRowView: View {
    @ObservedObject var budget: Budget
    
    var body: some View {
        NavigationLink(destination: BudgetView(budget: budget)) {
            HStack {
                Text(budget.name).lineLimit(1)
                
                Spacer()
                
                if budget.balance.doubleValue < 0 {
                    Text("$" + String(format: "%.2f", abs(budget.balance.doubleValue))).foregroundColor(.red)
                } else {
                    Text("$" + String(format: "%.2f", budget.balance.doubleValue))
                }
            }
        }.padding(.vertical)
    }
}
