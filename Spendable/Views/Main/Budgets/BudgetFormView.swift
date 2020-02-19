//
//  BudgetFormView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/28/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BudgetFormView: View {
    @ObservedObject var budgetInput: BudgetInput
    
    var body: some View {
        Form {
            HStack {
                Text("Name")
                
                Spacer()
                
                TextField("", text: $budgetInput.name)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            HStack {
                Text("Balance")
                
                Spacer()
                
                TextField("", text: $budgetInput.balance)
                    .foregroundColor(.secondary)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
            }
            
            HStack {
                Text("Goal")
                
                Spacer()
                
                TextField("", text: $budgetInput.goalBinding)
                    .foregroundColor(.secondary)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
}
