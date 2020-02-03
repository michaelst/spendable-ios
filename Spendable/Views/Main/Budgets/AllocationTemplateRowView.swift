//
//  AllocationTemplateRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationTemplateRowView: View {
    @ObservedObject var template: AllocationTemplate
    
    var body: some View {
        NavigationLink(destination: AllocationTemplateView(template: template)) {
            HStack {
                Text(template.name).lineLimit(1)
                
                Spacer()
                
                Text("$" + String(format: "%.2f", template.budgeted))
            }
        }.padding(.vertical)
    }
}

struct AllocationTemplateRowView_Previews: PreviewProvider {
    static var previews: some View {
        AllocationTemplateRowView(
            template: AllocationTemplate(id: "1", name: "Payday")
        )
    }
}
