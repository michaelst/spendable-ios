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
                
                Text(budget.balance.currencyValue).foregroundColor(budget.balance.doubleValue < 0 ? .red : .secondary)
            }
        }.padding(.vertical)
    }
}
