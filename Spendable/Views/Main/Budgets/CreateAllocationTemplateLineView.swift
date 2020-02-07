//
//  CreateAllocationTemplateLineView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CreateAllocationTemplateLineView: View {
    @ObservedObject var template: AllocationTemplate
    @ObservedObject var line: AllocationTemplateLine = AllocationTemplateLine(id: "temp-" + UUID().uuidString, amount: "0.00", budgetId: "")
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        AllocationTemplateLineFormView(line: line)
            .navigationBarItems(
                leading:
                Button("Cancel", action: {
                    self.presentationMode.wrappedValue.dismiss()
                }),
                trailing:
                Button("Add", action: {
                    self.template.lines.append(self.line)
                    self.presentationMode.wrappedValue.dismiss()
                }).disabled(self.line.amount.doubleValue == 0 || self.line.budgetId.isEmpty)
        )
    }
}

struct CreateAllocationTemplateLineView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAllocationTemplateLineView(
            template: AllocationTemplate(id: "1", name: "Payday")
        )
    }
}
