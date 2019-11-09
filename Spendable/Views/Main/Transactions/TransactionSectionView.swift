//
//  TransactionSectionView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/8/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionSectionView: View {    
    var date: Date
    var transactions: [Date: [Transaction]]
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter
    }()
    
    var body: some View {
        Section(header: Text("\(date, formatter: self.dateFormatter)")) {
            ForEach(self.transactions[self.date] ?? []) { transaction in
                TransactionRowView(transaction: transaction)
            }
        }
    }
}

struct TransactionSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionSectionView(
            date: Date(),
            transactions: [
                Date(): [
                    Transaction(id: "1", name: "Uber", amount: Float("10.51")!, date: Date(), category: Category(id: "1", name: "Ride Share")),
                    Transaction(id: "2", name: "Uber", amount: Float("10.51")!, date: Date(), category: Category(id: "1", name: "Ride Share"))
                ]
            ]
        )
    }
}
