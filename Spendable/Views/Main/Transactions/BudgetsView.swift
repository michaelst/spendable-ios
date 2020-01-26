//
//  BudgetsView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/24/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct BudgetsView: View {
    @EnvironmentObject var data: BudgetData
    
    var body: some View {
        NavigationView {
            List {
                ForEach((data.budgets.values).sorted { $0.balance > $1.balance}) { budget in
                    BudgetRowView(budgetId: budget.id)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Budgets")
            .navigationBarItems(trailing:
                Button(action: {
                    print("Help tapped!")
                }) {
                    Image(systemName: "plus.circle").font(.system(size: 24, weight: .regular))
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: { self.data.load() })
    }
    
}
