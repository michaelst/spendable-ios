//
//  CreateBudgetNameView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CreateBudgetNameView: View {
    @ObservedObject var budget: BudgetInput
    
    var body: some View {
        VStack {
            Form {
                TextField("", text: $budget.name)
            }
            
            Spacer()
        }
        .navigationBarTitle("Name")
    }
}
