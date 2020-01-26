//
//  CategoryPickerRowView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/9/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CategoryPickerRowView: View {
    var category: Category
    var isSelected: Bool
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(category.name)
                    Spacer()
                }
                
                if category.parentName != nil {
                    HStack {
                        Text(category.parentName ?? "").font(.footnote)
                        Spacer()
                    }.padding(.top, 8)
                }
            }
            
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark")
            }
        }.padding(.vertical)
    }
}
