//
//  BankAccountsView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/4/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BankAccountsView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack {
            if userData.showPlaidModal {
                PlaidView()
            }
            
            HStack {
                Button(action: { self.userData.showPlaidModal = true }) {
                    Text("Add bank")
                }
            }
        }
        .navigationBarTitle("Bank Accounts")
        .navigationBarItems(trailing:
            Button(action: { self.userData.showPlaidModal = true }) {
                Text("Add")
            }
        )
        
    }
}

struct BankAccountsView_Previews: PreviewProvider {
    static var previews: some View {
        BankAccountsView()
    }
}
