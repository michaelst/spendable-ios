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
    
    func login(email: String, password: String) {
        apollo.client.perform(mutation: LoginMutation(email: email, password: password)) { result in
            switch result {
            case .success(let body):
                if let data = body.data?.login {
                    self.apiToken = data.token
                }
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func signup(firstName: String, lastName: String, email: String, password: String) {
        apollo.client.perform(mutation: CreateUserMutation(firstName: firstName, lastName: lastName, email: email, password: password)) { result in
            guard let data = try? result.get().data else { return }
            self.apiToken = data.createUser?.token
        }
    }
    
    func updateCurrentUser() {
        apollo.client.perform(mutation: UpdateCurrentUserMutation(firstName: self.firstName, lastName: self.lastName, email: self.email))
    }
    
    func logout() {
        self.apiToken = nil
    }
}
