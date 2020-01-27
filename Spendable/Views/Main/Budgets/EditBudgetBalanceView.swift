//
//  EditBudgetBalanceView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct EditBudgetBalanceView: View {
    @EnvironmentObject var data: BudgetData
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var balance: String = ""
    
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
                TextField("Balance", text: $balance)
                    .keyboardType(.decimalPad)
            }
            Spacer()
        }
        .onAppear(perform: { self.setInitialValue() })
        .navigationBarTitle("Balance")
        .navigationBarItems(leading: backButton)
        .navigationBarBackButtonHidden(true)
    }
    
    private func setInitialValue() {
        balance = "\(budget.balance)"
    }
    
    private func save() {
        if let balanceDouble = Double(balance) {
            var budgetToUpdate = data.budgets[budgetId]!
            budgetToUpdate.balance = balanceDouble
            data.budgets[budgetId] = budgetToUpdate
        }
    }
}

