//
//  AllocationTemplateFormView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationTemplateFormView: View {
    @EnvironmentObject var userData: UserData
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
            
            Section(header: AllocationTemplateFormViewHeader(template: template), footer: AllocationTemplateFormViewFooter(template: template)) {
                ForEach(template.lines.sorted { $0.amount.doubleValue > $1.amount.doubleValue}) { line in
                    AllocationTemplateLineRowView(line: line)
                }
                .onDelete(perform: template.deleteLines)
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

struct AllocationTemplateFormViewHeader: View {
    @ObservedObject var template: AllocationTemplate
    
    var budgeted: Double {
        get {
            return template.lines.map { line in
                return line.amount.doubleValue
            }.reduce(0, +)
        }
    }
    
    var body: some View {
        HStack {
            Text("Budgets")
            
            Spacer()
            
            Text("$" + String(format: "%.2f", budgeted))
        }
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
