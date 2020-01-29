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
    let formatter = DateFormatter()
    
    var showPlaidModal = false {
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
    
    // MODELS
    
    var budgets: [Budget] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    var budgetsById: [String: Budget] {
        get {
            Dictionary(uniqueKeysWithValues: budgets.map { ($0.id, $0) })
        }
    }
    
    var categories: [Category] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    var categoriesById: [String: Category] {
        get {
            Dictionary(uniqueKeysWithValues: categories.map { ($0.id, $0) })
        }
    }
    
    var transactions: [Transaction] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    // FUNCTIONS
    
    func loadData() {
        loadCurrentUser()
        loadCategories()
        loadBudgets()
        loadTransactions()
    }
    
    func loadCurrentUser() {
        apollo.client.fetch(query: CurrentUserQuery()) { result in
            guard let data = try? result.get().data else { return }
            self.email = data.currentUser?.email ?? ""
        }
    }
    
    func updateCurrentUser() {
        apollo.client.perform(mutation: UpdateCurrentUserMutation(email: self.email))
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
    
    func signup(email: String, password: String) {
        apollo.client.perform(mutation: CreateUserMutation(email: email, password: password)) { result in
            guard let data = try? result.get().data else { return }
            self.apiToken = data.createUser?.token
        }
    }
    
    func logout() {
        self.apiToken = nil
    }
}
