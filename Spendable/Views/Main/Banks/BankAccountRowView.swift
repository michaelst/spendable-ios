//
//  BankAccountRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/4/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BankAccountRowView: View {
    @ObservedObject var bankAccount: BankAccount
    
    var body: some View {
        Toggle(isOn: $bankAccount.sync) {
            VStack {
                Text(bankAccount.name).frame(width: 80, alignment: .leading)
                
                Spacer()
                
                Text(String(format: "$%.2f", bankAccount.balance.doubleValue)).frame(width: 80, alignment: .leading)
            }
        }.padding(.vertical)
    }
}
