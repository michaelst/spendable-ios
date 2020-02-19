//
//  CreateBudgetView.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CreateBudgetView: View {
    @EnvironmentObject var userData: UserData
    @State var draftBudget: Budget = Budget(id: "draft")
    
    var body: some View {
        BudgetFormView(draftBudget: draftBudget, onSave: { self.userData.create(draftBudget: self.draftBudget) })
    }
}
