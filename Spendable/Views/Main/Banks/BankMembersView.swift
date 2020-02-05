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
    @EnvironmentObject var data: BankData
    
    var body: some View {
        ZStack {
            if userData.user.bankLimit == 0 {
                Text("Banks are currently only enabled for beta testers.")
            } else {
                if userData.showPlaidModal {
                    PlaidView()
                }
                
                List {
                    ForEach(data.bankMembers) { bankMember in
                        BankMemberRowView(bankMember: bankMember)
                    }
                }.listStyle(GroupedListStyle())
            }
        }
        .navigationBarTitle("Bank Accounts")
        .navigationBarItems(trailing:
            ZStack {
                if userData.user.bankLimit > 0 {
                    Button(action: { self.userData.showPlaidModal = true }) {
                        Image(systemName: "plus.circle").font(.system(size: 24, weight: .regular))
                    }
                }
            }
        )
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear(perform: { self.data.load() })
    }
}
