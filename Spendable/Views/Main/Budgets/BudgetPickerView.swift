//
//  BudgetPickerView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/27/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BudgetPickerView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var transaction: Transaction
    @State private var searchText = ""
    
    var budgets: [Budget] {
        get {
            if searchText == "" {
                return self.userData.budgets
            } else {
                return self.userData.budgets.filter({$0.name.lowercased().hasPrefix(searchText.lowercased())})
            }
        }
    }
    
    var body: some View {
        VStack() {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("search", text: $searchText).foregroundColor(.primary)
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
            }.padding(.horizontal)
            
            List(budgets) { budget in
                BudgetPickerRowView(budget: budget, isSelected: budget.id == self.transaction.budgetId)
                    .onTapGesture { self.transaction.budgetId = budget.id }
            }
        }
        .navigationBarTitle("Budgets")
    }
}
