//
//  EditNameView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/25/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct EditBudgetNameView: View {
    @EnvironmentObject var data: BudgetData
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var name: String = ""
    
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
                TextField("Name", text: $name)
            }
            Spacer()
        }
        .onAppear(perform: { self.setInitialValue() })
        .navigationBarTitle("Name")
        .navigationBarItems(leading: backButton)
        .navigationBarBackButtonHidden(true)
    }
    
    private func setInitialValue() {
        name = budget.name
    }
    
    private func save() {
        var budgetToUpdate = data.budgets[budgetId]!
        budgetToUpdate.name = name
        data.budgets[budgetId] = budgetToUpdate
    }
}
