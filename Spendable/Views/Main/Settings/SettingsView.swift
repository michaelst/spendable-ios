//
//  SettingsView.swift
//  Spendable
//
//  Created by Michael St Clair on 10/29/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var userData: UserData
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    TextField("first name", text: $userData.firstName)
                    TextField("last name", text: $userData.lastName)
                    TextField("email", text: $userData.email)
                }
                
                Section {
                    Button(action: { self.logout() }, label: {
                        Text("Save profile")
                    })
                }
                
                NavigationLink(destination: BankMembersView()) {
                        Text("Bank accounts")
                }
                
                Section {
                    Button(action: { self.logout() }, label: {
                        Text("Logout")
                    })
                }
            }.navigationBarTitle("Settings", displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func logout() {
        self.userData.apiToken = nil
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
