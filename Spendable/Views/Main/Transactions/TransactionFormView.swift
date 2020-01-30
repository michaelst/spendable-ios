//
//  TransactionFormView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/28/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionFormView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var transaction: Transaction
    
    var budget: Budget? {
        get {
            if transaction.budgetId != nil {
                return userData.budgetsById[transaction.budgetId!]
            } else {
                return nil
            }
        }
    }
    
    var category: Category? {
        get {
            if transaction.categoryId != nil {
                return userData.categoriesById[transaction.categoryId!]
            } else {
                return nil
            }
        }
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Name").foregroundColor(.secondary)
                    
                    Spacer()
                    
                    TextField("", text: $transaction.nameBinding).multilineTextAlignment(.trailing)
                }
                
                NavigationLink(destination: CategoryPickerView(transaction: transaction)) {
                    HStack {
                        Text("Category").foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text(category?.name ?? "")
                    }
                }
                
                NavigationLink(destination: BudgetPickerView(transaction: transaction)) {
                    HStack {
                        Text("Budget").foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text(budget?.name ?? "")
                    }
                }
            }
            
            Section(header: Text("Notes").foregroundColor(.secondary)) {
                TextField("", text: $transaction.noteBinding)
            }
        }
    }
}
