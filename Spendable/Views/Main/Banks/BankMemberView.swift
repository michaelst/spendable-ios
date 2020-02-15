//
//  BankMemberView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BankMemberView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var bankMember: BankMember
    @State private var publicToken: String?
    
    var body: some View {
        ZStack {
            if userData.showPlaidModal {
                PlaidView(publicToken: publicToken)
            }
            
            List {
                ForEach(bankMember.bankAccounts.sorted(by: { $0.balance.doubleValue > $1.balance.doubleValue})) { bankAccount in
                    BankAccountRowView(bankAccount: bankAccount)
                }
            }
            .navigationBarTitle(bankMember.name)
            .navigationBarItems(trailing:
                ZStack {
                    if bankMember.status != "CONNECTED" {
                        Button("Reconnect", action: {
                            self.userData.createPublicToken(bankMember: self.bankMember) { result in
                                self.setPublicTokenAndOpenPlaid(publicToken: result)
                            }
                        })
                    }
                }
            )
        }
    }
    
    func setPublicTokenAndOpenPlaid(publicToken: String) {
        self.publicToken = publicToken
        userData.showPlaidModal = true
    }
}
