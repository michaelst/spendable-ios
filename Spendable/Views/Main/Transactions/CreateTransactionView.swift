//
//  CreateTransactionView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/17/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CreateTransactionView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var transaction = Transaction(id: "temp-" + UUID().uuidString)
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        TransactionFormView(transaction: transaction)
            .navigationBarTitle("Create transaction")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading:
                Button("Cancel", action: {
                    self.presentationMode.wrappedValue.dismiss()
                }),
                trailing:
                Button("Add", action: {
                    self.userData.create(transaction: self.transaction)
                    self.presentationMode.wrappedValue.dismiss()
                })
        )
    }
}

struct CreateTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTransactionView()
    }
}
