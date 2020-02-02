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
            return self.userData.categories.filter { searchText.isEmpty || $0.name.range(of: searchText, options: [.caseInsensitive, .anchored]) != nil
                || $0.parentName?.range(of: searchText, options: [.caseInsensitive, .anchored]) != nil }
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
                        Image(systemName: "xmark.circle.fill").opacity(searchText.isEmpty ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
            }.padding(.horizontal)
            
            List(categories) { category in
                CategoryPickerRowView(category: category, isSelected: category.id == self.transaction.categoryId)
                    .onTapGesture { self.transaction.categoryId = category.id }
            }
        }
        .navigationBarTitle("Categories")
    }
}
