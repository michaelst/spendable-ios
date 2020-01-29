//
//  CreateBudgetView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CreateBudgetView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var budgetInput: BudgetInput = BudgetInput()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        BudgetFormView(budgetInput: budgetInput)
        .navigationBarTitle("Create budget")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
            Button("Cancel", action: {
                self.budgetInput.clear()
                self.presentationMode.wrappedValue.dismiss()
            }),
            trailing:
            Button("Add", action: {
                self.userData.create(budgetInput: self.budgetInput)
                self.presentationMode.wrappedValue.dismiss()
            })
        )
    }
}
