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
    @State private var isReloading = false
    @State private var page = 0
    
    var body: some View {
        NavigationView {
            Section {
                List {
                    ForEach(userData.sortedTransactions.indices, id: \.self) { index in
                        TransactionRowView(transaction: self.userData.sortedTransactions[index])
                            .onAppear(perform: { self.loadMore(index: index) })
                    }
                }
                .pullToRefresh(isShowing: $isReloading) {
                    self.userData.apollo.client.clearCache()
                    self.userData.loadTransactions()
                    self.isReloading = false
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle("Transactions")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func loadMore(index: Int) {
        if userData.hasMoreTransactions && !userData.loadingTransactions && Double(index) > (Double(userData.transactions.count) * 0.7) {
            userData.loadTransactions(page: page + 1)
            page += 1
        }
    }
}
