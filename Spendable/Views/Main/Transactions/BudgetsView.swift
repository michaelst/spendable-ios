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
                ForEach((data.budgets).sorted { $0.balance.doubleValue > $1.balance.doubleValue}) { budget in
                    BudgetRowView(budget: budget)
                }
                 .onDelete(perform: delete)
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
        .onAppear(perform: { self.data.load() })
    }
    
    func delete(at offsets: IndexSet) {
        //print(Array(offsets).first)
        //print(data.budgets.subscript(offsets).id)
        // TODO: setup deleting budgets
        data.budgets.remove(atOffsets: offsets)
    }
    
}
