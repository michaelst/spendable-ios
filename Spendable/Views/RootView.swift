//
//  ContentView.swift
//  Spendable
//
//  Created by Michael St Clair on 10/13/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var userData: UserData
    
    @ViewBuilder
    var body: some View {
        if userData.apiToken != nil {
            MainView()
        } else {
            AuthView()
        }
    }
}
