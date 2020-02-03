//
//  AllocationTemplateView.swift
//  Spendable
//
//  Created by Michael St Clair on 2/2/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct AllocationTemplateView: View {
    @ObservedObject var template: AllocationTemplate
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AllocationTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        AllocationTemplateView(
            template: AllocationTemplate(id: "1", name: "Payday")
        )
    }
}
