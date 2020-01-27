//
//  CreateBudgetBalanceView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CreateBudgetBalanceView: View {
    @ObservedObject var budget: BudgetInput
    
    var body: some View {
        VStack {
            Form {
                TextField("", text: $budget.balance)
                    .keyboardType(.decimalPad)
            }
            
            Spacer()
        }
        .navigationBarTitle("Balance")
    }
}
