//
//  Transaction.swift
//  Spendable
//
//  Created by Michael St Clair on 11/7/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation
import Apollo

struct Transaction: Identifiable {
    let apollo = Apollo()
    
    let id: String
    var name: String?
    var note: String?
    var amount: Float
    var date: Date
    var reviewed: Bool = false
    
    var category: Category?
    
    func save(resultHandler: ((Result<GraphQLResult<UpdateTransactionMutation.Data>, Error>) -> Void)?) {
        apollo.client.perform(mutation: UpdateTransactionMutation(id: id, name: name, note: note, categoryId: category?.id), resultHandler: resultHandler)
    }
}
