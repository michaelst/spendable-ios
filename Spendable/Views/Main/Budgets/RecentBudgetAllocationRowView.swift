//
//  RecentBudgetAllocationRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/17/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct RecentBudgetAllocationRowView: View {
    var allocation: RecentBudgetAllocation
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter
    }()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(allocation.name)
                    .lineLimit(1)
                
                Text("\(allocation.date, formatter: self.dateFormatter)")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(allocation.amount.currencyValue).foregroundColor(allocation.amount.doubleValue < 0 ? .red : .green)
                
                if allocation.pending {
                    Text("pending")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 8)
                }
            }.frame(width: 80, alignment: .trailing)
        }.padding(.vertical)
    }
}
