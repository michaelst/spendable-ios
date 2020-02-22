//
//  AllocationRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/1/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationRowView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var allocation: Allocation
    
    var budget: String {
        get {
            return userData.budgetsById[allocation.budgetId]!.name
        }
    }
    
    var body: some View {
        NavigationLink(destination: AllocationFormView(allocation: allocation)) {
            HStack {
                Text(budget).lineLimit(1)
                
                Spacer()
                
                Text(allocation.amount.currencyValue)
            }
        }.padding(.vertical)
    }
}
