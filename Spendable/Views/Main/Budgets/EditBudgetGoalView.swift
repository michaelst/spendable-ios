//
//  EditBudgetGoalView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct EditBudgetGoalView: View {
    @EnvironmentObject var data: BudgetData
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var goal: String = ""
    
    var budgetId: String
    
    private var budget: Budget {
        get {
            return data.budgets[budgetId]!
        }
    }
    
    var backButton : some View {
        Button(action: {
            self.save()
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left").padding()
        }
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Goal", text: $goal)
                    .keyboardType(.decimalPad)
            }
            Spacer()
        }
        .onAppear(perform: { self.setInitialValue() })
        .navigationBarTitle("Goal")
        .navigationBarItems(leading: backButton)
        .navigationBarBackButtonHidden(true)
    }
    
    private func setInitialValue() {
        if budget.goal != nil {
            goal = "\(budget.goal!)"
        }
    }
    
    private func save() {
        var budgetToUpdate = data.budgets[budgetId]!
        budgetToUpdate.goal = Double(goal)
        data.budgets[budgetId] = budgetToUpdate
    }
}
