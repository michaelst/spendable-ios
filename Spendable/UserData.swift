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
    
    var bankMembers: [BankMember] = [] {
        willSet { self.objectWillChange.send() }
    }
    
    func loadBankMembers() {
        apollo.client.fetch(query: ListBankMembersQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            guard let data = try? result.get().data else { return }
            
            self.bankMembers = []
            
            for bankMemberData in data.bankMembers ?? [] {
                var bankAccounts: [BankAccount] = []
                
                for bankAccountData in bankMemberData?.bankAccounts ?? [] {
                    if let id = bankAccountData?.id {
                        let bankAccount = BankAccount(id: id, name: bankAccountData?.name ?? "", sync: bankAccountData?.sync ?? false)
                        bankAccounts.append(bankAccount)
                    }
                }
                
                if let id = bankMemberData?.id {
                    let bankMember = BankMember(id: id, name: bankMemberData?.name ?? "", status: bankMemberData?.status, bankAccounts: bankAccounts)
                    self.bankMembers.append(bankMember)
                }
            }
        }
    }
}
