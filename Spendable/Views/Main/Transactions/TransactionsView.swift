//
//  TransactionsView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/3/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionsView: View {
    @EnvironmentObject var data: TransactionData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.transactions.keys.sorted(by: >), id: \.self) { date in
                    TransactionSectionView(date: date, transactions: self.data.transactions)
                }
            }.navigationBarTitle("Transactions", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: { self.data.setup() })
    }
}
