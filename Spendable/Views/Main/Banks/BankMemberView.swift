//
//  BankMemberView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BankMemberView: View {
    @ObservedObject var bankMember: BankMember
    
    var body: some View {
        List {
            ForEach(bankMember.bankAccounts) { bankAccount in
                BankAccountRowView(bankAccount: bankAccount)
            }
        }
        .navigationBarTitle(bankMember.name)
    }
}
