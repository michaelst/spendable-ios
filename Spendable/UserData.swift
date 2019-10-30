//
//  UserData.swift
//  Spendable
//
//  Created by Michael St Clair on 10/29/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import SwiftUI
import Combine
import KeychainSwift

final class UserData: ObservableObject  {
    let objectWillChange = ObservableObjectPublisher()
    let keychain = KeychainSwift()
    
    var apiToken : String? {
        get {
            keychain.get("api-token")
        }
        set {
            self.objectWillChange.send()
            
            if let newApiKey : String = newValue {
                keychain.set(newApiKey, forKey: "api-token")
            } else {
                keychain.delete("api-token")
            }
        }
    }
}
