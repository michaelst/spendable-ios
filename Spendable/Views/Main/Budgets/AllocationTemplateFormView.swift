//
//  AllocationTemplateFormView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationTemplateFormView: View {
    @ObservedObject var template: AllocationTemplate
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Name").foregroundColor(.secondary)
                    
                    Spacer()
                    
                    TextField("", text: $template.name).multilineTextAlignment(.trailing)
                }
            }
            
            Section(header: Text("Budgets"), footer: AllocationTemplateFormViewFooter(template: template)) {
                ForEach(template.lines) { line in
                    Text(line.amount)
                }
            }
        }
    }
}

struct AllocationTemplateFormView_Previews: PreviewProvider {
    static var previews: some View {
        AllocationTemplateFormView(
            template: AllocationTemplate(id: "1", name: "Payday")
        )
    }
}

struct AllocationTemplateFormViewFooter: View {
    @ObservedObject var template: AllocationTemplate
    
    var body: some View {
        NavigationLink(destination: CreateAllocationTemplateLineView(template: template)) {
            Text("Add budget")
        }
    }
}
