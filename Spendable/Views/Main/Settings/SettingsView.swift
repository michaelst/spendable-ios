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
    
    var body: some View {
        NavigationView {
            Form {                   
                Section {
                    NavigationLink(destination: BankMembersView()) {
                        Text("Banks")
                    }
                    
                    NavigationLink(destination: AllocationTemplatesView()) {
                        Text("Budget Templates")
                    }
                }
                
                Section {
                    Toggle("Notifications", isOn: $userData.notificationSettings.enabled)
                }
                
                Section {
                    Button("Logout", action: { self.userData.logout() })
                }
            }.navigationBarTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
