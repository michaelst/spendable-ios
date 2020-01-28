//
//  TransactionsView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/3/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionsView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            Section {
                List {
                    ForEach((userData.transactions).sorted { $0.date > $1.date}) { transaction in
                        TransactionRowView(transaction: transaction)
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle("Transactions")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: { self.userData.loadTransactions() })
    }
}
