//
//  TransactionView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/7/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionView: View {
    @EnvironmentObject var data: TransactionData
    @Environment(\.presentationMode) var presentation
    var transactionId: String
    
    private var transaction: Transaction {
        get {
            return data.transactions[transactionId]!
        }
    }
    
    @State private var name: String = ""
    @State private var categoryId: String = ""
    @State private var note: String = ""
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Name").foregroundColor(.secondary)
                    
                    Spacer()
                    
                    TextField("", text: $name).multilineTextAlignment(.trailing)
                }
                
                NavigationLink(destination: CategoryPickerView(transaction: transaction)) {
                    HStack {
                        Text("Category").foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text(transaction.category?.name ?? "")
                    }
                }
            }
            
            Section(header: Text("Notes").foregroundColor(.secondary)) {
                TextField("", text: $note)
            }
            
            Section {
                Button(action: { self.save() }, label: {
                    Text("Save")
                })
            }
        }.onAppear(perform: { self.setInitialValues() })
    }
    
    private func setInitialValues() {
        name = transaction.name ?? ""
        note = transaction.note ?? ""
        categoryId = transaction.category?.id ?? ""
    }
    
    private func save() {
        var transactionToUpdate = data.transactions[transactionId]!
        transactionToUpdate.name = name
        transactionToUpdate.note = note
        transactionToUpdate.save(resultHandler: { result in
            switch result {
            case .success:
                self.data.transactions[self.transactionId] = transactionToUpdate
                self.presentation.wrappedValue.dismiss()
            case .failure(let error):
                print("error: \(error)")
            }
        })
    }
}
