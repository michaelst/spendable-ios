//
//  CategoryPickerView.swift
//  Spendable
//
//  Created by Michael St Clair on 11/9/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI

struct CategoryPickerView: View {
    @EnvironmentObject var data: TransactionData
    @Environment(\.presentationMode) var presentation
    @State var transaction: Transaction
    @State private var searchText = ""
    
    var categories: [Category] {
        get {
            if searchText == "" {
                return self.data.categories
            } else {
                return self.data.categories.filter({$0.name.lowercased().hasPrefix(searchText.lowercased()) || ($0.parentName != nil && $0.parentName!.lowercased().hasPrefix(searchText.lowercased()))})
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
                CategoryPickerRowView(category: category, isSelected: category.id == self.transaction.category?.id)
                    .onTapGesture { self.saveCategoryToTransaction(category) }
            }
            .modifier(DismissingKeyboard())
        }
        .navigationBarTitle("Categories")
    }
    
    private func saveCategoryToTransaction(_ category: Category) {
        transaction.category = category
        transaction.save(resultHandler: { result in
            switch result {
            case .success:
                self.data.transactions[self.transaction.id] = self.transaction
                self.presentation.wrappedValue.dismiss()
            case .failure(let error):
                print("error: \(error)")
            }
        })
    }
}

struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content.onTapGesture { UIApplication.shared.keyWindow?.endEditing(true) }
    }
}
