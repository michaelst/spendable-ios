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
                    
                    if userData.user.spendable.doubleValue < 0 {
                        Text("($" + String(format: "%.2f", abs(userData.user.spendable.doubleValue)) + ")").foregroundColor(.red)
                    } else {
                        Text("$" + String(format: "%.2f", userData.user.spendable.doubleValue))
                    }
                }.padding(.vertical)
                
                ForEach((userData.budgets).sorted { $0.balance.doubleValue > $1.balance.doubleValue}) { budget in
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
        .onAppear(perform: { self.userData.loadBudgets() })
    }
    
}
