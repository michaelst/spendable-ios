//
//  BudgetView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BudgetView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var budget: Budget
    @ObservedObject var budgetInput: BudgetInput = BudgetInput()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var name: String = ""
    
    private func setInitialValue() {
        budgetInput.name = budget.name
        budgetInput.balance = budget.balance
        budgetInput.goal = budget.goal
    }
    
    var body: some View {
        BudgetFormView(budgetInput: budgetInput)
        .onAppear(perform: { self.setInitialValue() })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button("Cancel", action: { self.presentationMode.wrappedValue.dismiss() }),
            trailing: Button("Save", action: {
                self.userData.update(budget: self.budget, budgetInput: self.budgetInput)
                self.presentationMode.wrappedValue.dismiss()
            })
        )
    }
}
