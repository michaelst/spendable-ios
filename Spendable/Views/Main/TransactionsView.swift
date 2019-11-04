//
//  TransactionsView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/3/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct TransactionsView: View {
    @State var modalDisplayed = false
    
    @ViewBuilder
    var body: some View {
        if self.modalDisplayed {
            PlaidViewController(onDismiss: {
                self.modalDisplayed = false
            })
        } else {
            Button(action: { self.modalDisplayed = true }) {
                Text("Add bank")
            }
        }
        
    }
}
