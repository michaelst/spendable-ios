//
//  TransactionView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/7/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var transaction: Transaction
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        TransactionFormView(transaction: transaction)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button("Cancel", action: {
                self.userData.reload(transaction: self.transaction)
                self.presentationMode.wrappedValue.dismiss()
            }),
            trailing: Button("Save", action: {
                self.userData.update(transaction: self.transaction)
                self.presentationMode.wrappedValue.dismiss()
            })
        )
    }
}
