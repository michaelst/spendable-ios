//
//  TransactionsView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/3/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionsView: View {
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
        
    }
}
