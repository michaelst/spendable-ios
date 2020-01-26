//
//  MainView.swift
//  Spendable
//
//  Created by Michael St Clair on 10/29/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        TabView {
            BudgetsView()
                .tabItem {
                    VStack {
                        Image(systemName: "calendar")
                        Text("Budgets")
                    }
                    
            }
            .tag(1)
            
            TransactionsView()
                .tabItem {
                    VStack {
                        Image(systemName: "dollarsign.circle")
                        Text("Transactions")
                    }
                    
            }
            .tag(2)
            
            BankMembersView()
                .tabItem {
                    VStack {
                        Image(systemName: "creditcard")
                        Text("Banks")
                    }
                    
            }
            .tag(3)
            
            SettingsView()
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    
            }
            .tag(4)
        }
        .accentColor(Color(red: 67 / 255, green: 150 / 255, blue: 223 / 255))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
