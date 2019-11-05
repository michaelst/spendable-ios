//
//  ApolloClient.swift
//  Spendable
//
//  Created by Michael St Clair on 10/13/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import Foundation
import Apollo
import SwiftUI
import KeychainSwift

class Apollo {
    
    let keychain = KeychainSwift()
    
    static let shared = Apollo()
    
    private lazy var networkTransport = HTTPNetworkTransport(
        url: URL(string: "https://spendable.dev/graphql")!,
        delegate: self
    )
    
    private(set) lazy var client = ApolloClient(networkTransport: self.networkTransport)
}

// MARK: - Pre-flight delegate

extension Apollo: HTTPNetworkTransportPreflightDelegate {
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return true
    }
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
        
        // Get the existing headers, or create new ones if they're nil
        var headers = request.allHTTPHeaderFields ?? [String: String]()
        
        // Add any new headers you need
        if let token = keychain.get("api-token") {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        // Re-assign the updated headers to the request.
        request.allHTTPHeaderFields = headers
    }
}
