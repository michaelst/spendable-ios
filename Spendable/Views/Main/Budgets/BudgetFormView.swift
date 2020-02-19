//
//  BudgetFormView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/28/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BudgetFormView: View {
    @State var draftBudget: Budget
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var onSave = {}
    var onCancel = {}
    
    var body: some View {
        Form {
            TextField("Name", text: $draftBudget.name)
            TextField("Balance", text: $draftBudget.balance).keyboardType(.decimalPad)
            TextField("Goal", text: $draftBudget.goalBinding).keyboardType(.decimalPad)
        }
        .navigationBarItems(
            leading: Button("Cancel", action: {
                self.onCancel()
                self.clearDraftData()
                self.presentationMode.wrappedValue.dismiss()
            }),
            trailing: Button("Save", action: {
                self.onSave()
                self.clearDraftData()
                self.presentationMode.wrappedValue.dismiss()
            })
        )
    }
    
    private func clearDraftData () {
        draftBudget.name = ""
        draftBudget.balance = ""
        draftBudget.goal = nil
    }
}
