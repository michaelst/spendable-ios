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
    
    let apollo = Apollo()
    let keychain = KeychainSwift()
    
    var showPlaidModal = false {
        willSet { self.objectWillChange.send() }
    }
    
    var firstName = "" {
        willSet { self.objectWillChange.send() }
    }
    
    var lastName = "" {
        willSet { self.objectWillChange.send() }
    }
    
    var email = "" {
        willSet { self.objectWillChange.send() }
    }
    
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
    
    func loadCurrentUser() {
        apollo.client.fetch(query: CurrentUserQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            guard let data = try? result.get().data else { return }
            self.firstName = data.currentUser?.firstName ?? ""
            self.lastName = data.currentUser?.lastName ?? ""
            self.email = data.currentUser?.email ?? ""
        }
    }
    
    func updateCurrentUser() {
        apollo.client.perform(mutation: UpdateCurrentUserMutation(firstName: self.firstName, lastName: self.lastName, email: self.email))
    }
    
    func logout() {
        self.apiToken = nil
    }
}
