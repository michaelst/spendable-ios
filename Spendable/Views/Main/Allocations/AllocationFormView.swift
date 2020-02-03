//
//  AllocationFormView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/1/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationFormView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var allocation: Allocation
    
    var budget: String {
        get {
            return userData.budgetsById[allocation.budgetId]?.name ?? ""
        }
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Amount").foregroundColor(.secondary)
                    
                    Spacer()
                    
                    TextField("", text: $allocation.amount)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
                
                NavigationLink(destination: BudgetPickerView(budgetId: allocation.budgetId, updateBudget: { budgetId in self.allocation.budgetId = budgetId })) {
                    HStack {
                        Text("Budget").foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text(budget)
                    }
                }
            }
        }
    }
}
