//
//  CategoryData.swift
//  Spendable
//
//  Created by Michael St Clair on 1/27/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation

extension UserData {
    func loadCategories() {
        apollo.client.fetch(query: ListCategoriesQuery()) { result in
            guard let data = try? result.get().data else { return }
            self.processData(data: data)
        }
    }
    
    private func processData(data: ListCategoriesQuery.Data) {
        var categoriesFromData: [Category] = []
        
        for categoryData in data.categories ?? [] {
            if let id = categoryData?.id, let name = categoryData?.name {
                let category = Category(id: id, name: name, parentName: categoryData?.parentName)
                categoriesFromData.append(category)
            }
        }
        
        categories = categoriesFromData
    }
}
