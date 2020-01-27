//
//  EditNameView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/25/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct EditBudgetNameView: View {
    @ObservedObject var budget: Budget
    
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
