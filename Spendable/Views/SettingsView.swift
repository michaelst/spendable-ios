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
        Button(action: { self.logout() }, label: {
            Text("Logout")
        })
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
