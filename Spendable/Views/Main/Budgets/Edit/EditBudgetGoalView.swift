//
//  EditBudgetGoalView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct EditBudgetGoalView: View {
    @ObservedObject var budget: Budget
    
    var body: some View {
        VStack {
            Form {
                TextField("", text: $budget.goalBinding)
                    .keyboardType(.decimalPad)
            }
            
            Spacer()
        }
        .navigationBarTitle("Goal")
    }
}
