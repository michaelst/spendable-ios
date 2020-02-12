//
//  AllocationTemplatesView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationTemplatesView: View {
    @EnvironmentObject var userData: UserData
    @State private var isReloading = false
    
    var body: some View {
        Section {
            List {
                ForEach(userData.allocationTemplates) { template in
                    AllocationTemplateRowView(template: template)
                }
                .onDelete(perform: userData.deleteAllocationTemplates)
            }
            .pullToRefresh(isShowing: $isReloading) {
                self.userData.apollo.client.clearCache()
                self.userData.loadAllocationTemplates()
                self.isReloading = false
            }
            .listStyle(GroupedListStyle())
        }
        .navigationBarTitle("Templates")
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarItems(trailing:
            NavigationLink(destination: CreateAllocationTemplateView()) {
                Image(systemName: "plus.circle").font(.system(size: 24, weight: .regular))
            }
        )
    }
}
