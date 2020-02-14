//
//  BankMemberRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/4/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BankMemberRowView: View {
    @ObservedObject var bankMember: BankMember
    
    var body: some View {
        NavigationLink(destination: BankMemberView(bankMember: bankMember)) {
            HStack {
                Text(bankMember.name)
                
                if bankMember.status != "CONNECTED" {
                    Spacer()
                    Image(systemName: "exclamationmark.circle").foregroundColor(.red)
                }
            }
        }
        .padding(.vertical)
    }
}
