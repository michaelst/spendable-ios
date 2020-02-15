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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var searchText = ""
    var budgetId: String
    var updateBudget: (String) -> Void
    
    var budgets: [Budget] {
        get {
            return self.userData.budgets.filter { searchText.isEmpty || $0.name.range(of: searchText, options: .caseInsensitive) != nil }
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
                BudgetPickerRowView(budget: budget, isSelected: budget.id == self.budgetId)
                    .onTapGesture {
                        self.updateBudget(budget.id)
                        self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .navigationBarTitle("Budgets")
    }
}
