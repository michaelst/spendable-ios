//
//  ApolloClient.swift
//  Spendable
//
//  Created by Michael St Clair on 10/13/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation
import Apollo

class Apollo {
  static let shared = Apollo()
    
  private(set) lazy var client = ApolloClient(url: URL(string: "https://spendable.dev/graphql")!)
}
