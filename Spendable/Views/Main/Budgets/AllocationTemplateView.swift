//
//  AllocationTemplateView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationTemplateView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var template: AllocationTemplate
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        AllocationTemplateFormView(template: template)
            .navigationBarTitle("Template")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading:
                Button("Cancel", action: {
                    self.presentationMode.wrappedValue.dismiss()
                }),
                trailing:
                Button("Save", action: {
                    self.userData.update(template: self.template)
                    self.presentationMode.wrappedValue.dismiss()
                }).disabled(self.template.name.isEmpty || self.template.lines.count == 0)
        )
    }
}

struct AllocationTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        AllocationTemplateView(
            template: AllocationTemplate(id: "1", name: "Payday")
        )
    }
}
