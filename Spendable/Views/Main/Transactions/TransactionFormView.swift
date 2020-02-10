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
    
    var category: Category? {
        get {
            if transaction.categoryId != nil {
                return userData.categoriesById[transaction.categoryId!]
            } else {
                return nil
            }
        }
    }
    
    var budgetNames: String {
        get {
            transaction.allocations
                .sorted(by: { $0.amount.doubleValue > $1.amount.doubleValue })
                .map({ userData.budgetsById[$0.budgetId]!.name })
                .joined(separator: ", ")
        }
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Name").frame(width: 80, alignment: .leading)
                    
                    Spacer()
                    
                    TextField("Name", text: $transaction.nameBinding)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text("Amount")
                    
                    Spacer()
                    
                    TextField("", text: $transaction.amount)
                        .foregroundColor(.secondary)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
                
                DatePicker(selection: $transaction.date, in: ...Date(), displayedComponents: .date) {
                    Text("Date")
                }
            }
            
            Section {                
                NavigationLink(destination: CategoryPickerView(transaction: transaction)) {
                    HStack {
                        Text("Category").frame(width: 80, alignment: .leading)
                        
                        Spacer()
                        
                        Text(category?.name ?? "").lineLimit(1).foregroundColor(.secondary)
                    }
                }
                
                NavigationLink(destination: AllocationsView(transaction: transaction)) {
                    HStack {
                        if transaction.allocations.count > 1 {
                            Text("Budgets").frame(width: 80, alignment: .leading)
                        } else {
                            Text("Budget").frame(width: 80, alignment: .leading)
                        }
                        
                        Spacer()
                        
                        Text(budgetNames).lineLimit(1).foregroundColor(.secondary)
                    }
                }
            }
            
            Section(header: Text("Notes").foregroundColor(.secondary)) {
                TextField("", text: $transaction.noteBinding)
            }
        }
    }
}
