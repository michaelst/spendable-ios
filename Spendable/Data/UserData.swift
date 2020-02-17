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
    
    
    var deviceToken : String? {
        get {
            keychain.get("device-token")
        }
        set {
            self.objectWillChange.send()
            
            if newValue != nil {
                keychain.set(newValue!, forKey: "device-token")
            }
        }
    }
    
    // MODELS
    
    var user = User(spendable: "0") {
        willSet { self.objectWillChange.send() }
    }
    
    var notificationSettings = NotificationSettings() {
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
    
    var bankMembers: [BankMember] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    var budgets: [Budget] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    var sortedBudgets: [Budget] {
        get {
            budgets.sorted(by: { $0.balance.doubleValue > $1.balance.doubleValue})
        }
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
    
    var loadingTransactions = false
    var hasMoreTransactions = true
    
    var transactions: [Transaction] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    var sortedTransactions: [Transaction] {
        get {
            transactions.sorted(by: { $0.date > $1.date})
        }
    }
    
    // FUNCTIONS
    
    func loadData() {
        loadCurrentUser()
        loadNotificationSettings()
        loadCategories()
        loadBudgets()
        loadTransactions()
        loadAllocationTemplates()
        loadBankMembers()
    }
    
    func loadCurrentUser() {
        apollo.client.fetch(query: CurrentUserQuery()) { result in
            guard let data = try? result.get().data else { return }
            self.user.spendable = data.currentUser!.spendable!
            self.user.bankLimit = data.currentUser!.bankLimit!
        }
    }
    
    var loginErrors: [GraphQLError] = [] {
        willSet { self.objectWillChange.send() }
    }
  
    func signInWithApple(token: String) {
        apollo.client.perform(mutation: SignInWithAppleMutation(token: token)) { result in
            if let data = try? result.get().data?.signInWithApple {
                self.apiToken = data.token
                self.user.spendable = data.spendable ?? "0"
                self.user.bankLimit = data.bankLimit ?? 0
                self.loadData()
            } else if let errors = try? result.get().errors {
                self.loginErrors = errors
            }
        }
    }
    
    func login(email: String, password: String) {
        apollo.client.perform(mutation: LoginMutation(email: email, password: password)) { result in
            if let data = try? result.get().data?.login {
                self.apiToken = data.token
                self.user.spendable = data.spendable ?? "0"
                self.user.bankLimit = data.bankLimit ?? 0
                self.loadData()
            } else if let errors = try? result.get().errors {
                self.loginErrors = errors
            }
        }
    }
    
    func signup(email: String, password: String) {
        apollo.client.perform(mutation: CreateUserMutation(email: email, password: password)) { result in
            guard let data = try? result.get().data?.createUser else { return }
            self.apiToken = data.token
            self.user.spendable = data.spendable ?? "0"
            self.user.bankLimit = data.bankLimit ?? 0
        }
    }
    
    func logout() {
        apollo.client.clearCache()
        apiToken = nil
    }
}
