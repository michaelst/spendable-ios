//
//  AllocationTemplateLineFormView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationTemplateLineFormView: View {
    @ObservedObject var line: AllocationTemplateLine
    @EnvironmentObject var userData: UserData
    
    var budget: String {
        get {
            return userData.budgetsById[line.budgetId]?.name ?? ""
        }
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Amount").foregroundColor(.secondary)
                    
                    Spacer()
                    
                    TextField("", text: $line.amount)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
                
                //NavigationLink(destination: BudgetPickerView(allocation: allocation)) {
                //    HStack {
                //        Text("Budget").foregroundColor(.secondary)
                //
                //        Spacer()
                //
                //        Text(budget)
                //    }
                //}
            }
        }
    }
}
