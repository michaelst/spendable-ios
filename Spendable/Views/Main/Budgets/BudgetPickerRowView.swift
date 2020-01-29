//
//  BudgetPickerRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/27/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BudgetPickerRowView: View {
    var budget: Budget
    var isSelected: Bool
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(budget.name)
                    Spacer()
                }
                
                HStack {
                    if budget.balance.doubleValue < 0 {
                        Text("$" + String(format: "%.2f", abs(budget.balance.doubleValue))).foregroundColor(.red).font(.footnote)
                    } else {
                        Text("$" + String(format: "%.2f", budget.balance.doubleValue)).font(.footnote)
                    }
                    
                    Spacer()
                }.padding(.top, 8)
            }
            
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark")
            }
        }.padding(.vertical)
    }
}
