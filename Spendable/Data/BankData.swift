//
//  BankAccountData.swift
//  Spendable
//
//  Created by Michael St Clair on 1/26/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation

extension UserData  {
    func loadBankMembers() {
        apollo.client.fetch(query: ListBankMembersQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
            guard let data = try? result.get().data else { return }
            self.load(data: data)
        }
    }
    
    func load(data: ListBankMembersQuery.Data) {
        var list: [BankMember] = []
        
        for bankMemberData in data.bankMembers ?? [] {
            var bankAccounts: [BankAccount] = []
            
            for bankAccountData in bankMemberData?.bankAccounts ?? [] {
                if let bankAccountid = bankAccountData?.id {
                    let bankAccount = BankAccount(
                        id: bankAccountid,
                        name: bankAccountData?.name ?? "",
                        sync: bankAccountData?.sync ?? false,
                        balance: bankAccountData?.balance ?? "0"
                    )
                    bankAccounts.append(bankAccount)
                }
            }
            
            if let id = bankMemberData?.id {
                let bankMember = BankMember(
                    id: id,
                    logo: Data(base64Encoded: bankMemberData!.logo!)!,
                    name: bankMemberData!.name!,
                    status: bankMemberData!.status,
                    bankAccounts: bankAccounts
                )
                list.append(bankMember)
            }
        }
        
        bankMembers = list
    }
    
    func createBankMember(publicToken: String) {
        apollo.client.perform(mutation: CreateBankMemberMutation(publicToken: publicToken)) { result in
            guard let data = try? result.get().data?.createBankMember else { return }
            
            var bankAccounts: [BankAccount] = []
            
            for bankAccountData in data.bankAccounts ?? [] {
                if let bankAccountid = bankAccountData?.id {
                    let bankAccount = BankAccount(
                        id: bankAccountid,
                        name: bankAccountData?.name ?? "",
                        sync: bankAccountData?.sync ?? false,
                        balance: bankAccountData?.balance ?? "0"
                    )
                    
                    bankAccounts.append(bankAccount)
                }
            }
            
            if let id = data.id {
                let bankMember = BankMember(
                    id: id,
                    logo: Data(base64Encoded: data.logo!)!,
                    name: data.name!,
                    status: data.status,
                    bankAccounts: bankAccounts
                )
                self.bankMembers.append(bankMember)
            }
        }
    }
    
    func createPublicToken(bankMember: BankMember, completion: @escaping (String) -> Void) {
        apollo.client.perform(mutation: CreatePublicTokenMutation(id: bankMember.id)) { result in
            guard let data = try? result.get().data?.createPublicToken else { return }
            completion(data)
        }
    }
}
