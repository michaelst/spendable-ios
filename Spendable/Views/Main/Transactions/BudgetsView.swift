//
//  BudgetsView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct BudgetsView: View {
    @EnvironmentObject var userData: UserData
    @State private var showingSheet = false
    @State private var isReloading = false
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Spendable")
                    
                    Spacer()
                    
                    Text(userData.user.spendable.currencyValue).foregroundColor(userData.user.spendable.doubleValue < 0 ? .red : .secondary)
                 }.padding(.vertical)
                
                ForEach(userData.sortedBudgets) { budget in
                    BudgetRowView(budget: budget)
                }
                .onDelete(perform: userData.deleteBudgets)
            }
            .pullToRefresh(isShowing: $isReloading) {
                self.userData.apollo.client.clearCache()
                self.userData.loadCurrentUser()
                self.userData.loadBudgets()
                self.isReloading = false
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Budgets")
            .navigationBarItems(trailing:
                NavigationLink(destination: CreateBudgetView()) {
                    Image(systemName: "plus.circle").font(.system(size: 24, weight: .regular))
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: {
            self.userData.loadCurrentUser()
            self.userData.loadBudgets()
        })
    }
    
}
