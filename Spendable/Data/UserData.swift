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
import Apollo

final class UserData: ObservableObject  {
    let objectWillChange = ObservableObjectPublisher()
    let apollo = Apollo()
    let keychain = KeychainSwift()
    let dateFormatter = DateFormatter()
    
    var showPlaidModal = false {
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
    
    var user = User(email: "", spendable: "0") {
        willSet { self.objectWillChange.send() }
    }
    
    var allocationTemplates: [AllocationTemplate] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    var allocationTemplatesById: [String: AllocationTemplate] {
        get {
            Dictionary(uniqueKeysWithValues: allocationTemplates.map { ($0.id, $0) })
        }
    }
    
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
            self.user.email = data.currentUser?.email ?? ""
            self.user.spendable = data.currentUser?.spendable ?? "0"
            self.user.bankLimit = data.currentUser?.bankLimit ?? 0
        }
    }
    
    func updateCurrentUser() {
        apollo.client.perform(mutation: UpdateCurrentUserMutation(email: self.user.email)) { result in
            self.apollo.client.clearCache()
        }
    }
    
    var loginErrors: [GraphQLError] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    func login(email: String, password: String) {
        apollo.client.perform(mutation: LoginMutation(email: email, password: password)) { result in
            if let data = try? result.get().data?.login {
                self.apiToken = data.token
                self.user.email = data.email ?? ""
                self.user.spendable = data.spendable ?? "0"
                self.user.bankLimit = data.bankLimit ?? 0
            } else if let errors = try? result.get().errors {
                self.loginErrors = errors
            }
        }
    }
    
    func signup(email: String, password: String) {
        apollo.client.perform(mutation: CreateUserMutation(email: email, password: password)) { result in
            guard let data = try? result.get().data?.createUser else { return }
            self.apiToken = data.token
            self.user.email = data.email ?? ""
            self.user.spendable = data.spendable ?? "0"
            self.user.bankLimit = data.bankLimit ?? 0
        }
    }
    
    func logout() {
        apiToken = nil
    }
}
