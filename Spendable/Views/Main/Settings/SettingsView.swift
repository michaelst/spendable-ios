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
                Section {
                    TextField("email", text: $userData.email)
                }
                
                Section {
                    Button(action: { self.userData.updateCurrentUser() }, label: {
                        Text("Save")
                    })
                }
                
                Section {
                    NavigationLink(destination: BankMembersView()) {
                        Text("Banks")
                    }
                    
                    NavigationLink(destination: AllocationTemplatesView()) {
                        Text("Budget Templates")
                    }
                }
                
                Section {
                    Button(action: { self.userData.logout() }, label: {
                        Text("Logout")
                    })
                }
            }.navigationBarTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: { self.userData.loadCurrentUser() })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
