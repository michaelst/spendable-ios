//
//  AllocationTemplateLineRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationTemplateLineRowView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var line: AllocationTemplateLine
    
    var budget: String {
        get {
            return userData.budgetsById[line.budgetId]!.name
        }
    }
    
    var body: some View {
        NavigationLink(destination: AllocationTemplateLineFormView(line: line)) {
            HStack {
                Text(budget).lineLimit(1)
                
                Spacer()
                
                Text("$" + String(format: "%.2f", line.amount.doubleValue))
            }
        }.padding(.vertical)
    }
}
