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
            Section {
                HStack {
                    Text("Name").foregroundColor(.secondary)
                    
                    Spacer()
                    
                    TextField("", text: $budgetInput.name).multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Goal").foregroundColor(.secondary)
                    
                    Spacer()
                    
                    TextField("", text: $budgetInput.goalBinding).multilineTextAlignment(.trailing)
                }
            }
        }
    }
}
