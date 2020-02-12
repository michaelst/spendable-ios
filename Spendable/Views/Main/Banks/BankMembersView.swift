//
//  BankAccountsView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/4/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BankMembersView: View {
    @EnvironmentObject var userData: UserData
    @State private var isReloading = false
    
    var body: some View {
        ZStack {
            if userData.user.bankLimit == 0 {
                Text("Banks are currently only enabled for beta testers.")
            } else {
                if userData.showPlaidModal {
                    PlaidView()
                }
                
                List {
                    ForEach(userData.bankMembers) { bankMember in
                        BankMemberRowView(bankMember: bankMember)
                    }
                }
                .pullToRefresh(isShowing: $isReloading) {
                    self.userData.apollo.client.clearCache()
                    self.userData.loadCurrentUser()
                    self.userData.loadBankMembers()
                    self.isReloading = false
                }
                .listStyle(GroupedListStyle())
            }
        }
        .navigationBarTitle("Bank Accounts")
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarItems(trailing:
            ZStack {
                if userData.user.bankLimit > userData.bankMembers.count {
                    Button(action: { self.userData.showPlaidModal = true }) {
                        Image(systemName: "plus.circle").font(.system(size: 24, weight: .regular))
                    }
                }
            }
        )
    }
}
