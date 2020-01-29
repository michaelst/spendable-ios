//
//  CategoryPickerView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/9/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CategoryPickerView: View {
    @EnvironmentObject var userData: UserData
    @ObservedObject var transaction: Transaction
    @State private var searchText = ""
    
    var categories: [Category] {
        get {
            if searchText == "" {
                return self.userData.categories
            } else {
                return self.userData.categories.filter({$0.name.lowercased().hasPrefix(searchText.lowercased()) || ($0.parentName != nil && $0.parentName!.lowercased().hasPrefix(searchText.lowercased()))})
            }
        }
    }
    
    var body: some View {
        VStack() {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("search", text: $searchText).foregroundColor(.primary)
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
            }.padding(.horizontal)
            
            List(categories) { category in
                CategoryPickerRowView(category: category, isSelected: category.id == self.transaction.categoryId)
                    .onTapGesture {
                        print(category.id)
                        self.transaction.categoryId = category.id }
            }
        }
        .navigationBarTitle("Categories")
    }
}
