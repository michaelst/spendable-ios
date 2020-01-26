//
//  BankMemberRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/4/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BankMemberRowView: View {
    let bankMember: BankMember
    
    var body: some View {
        Section(header: Text(self.bankMember.name)) {
            ForEach(self.bankMember.bankAccounts) { bankAccount in
                BankAccountRowView(bankAccount: bankAccount)
            }
        }
    }
}
