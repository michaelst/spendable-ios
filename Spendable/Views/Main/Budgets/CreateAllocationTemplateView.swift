//
//  CreateAllocationTemplateView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CreateAllocationTemplateView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var template: AllocationTemplate = AllocationTemplate(id: "", name: "")
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        AllocationTemplateFormView(template: template)
            .navigationBarTitle("Create template")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading:
                Button("Cancel", action: {
                    self.presentationMode.wrappedValue.dismiss()
                }),
                trailing:
                Button("Add", action: {
                    self.userData.create(template: self.template)
                    self.presentationMode.wrappedValue.dismiss()
                }).disabled(self.template.name.isEmpty || self.template.lines.count == 0)
        )
    }
}

struct CreateAllocationTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAllocationTemplateView(
            template: AllocationTemplate(id: "1", name: "Payday")
        )
    }
}
