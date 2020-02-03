//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ListBankMembersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query ListBankMembers {
      bankMembers {
        __typename
        id
        name
        status
        bankAccounts {
          __typename
          id
          name
          sync
        }
      }
    }
    """

  public let operationName = "ListBankMembers"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootQueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("bankMembers", type: .list(.object(BankMember.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(bankMembers: [BankMember?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "bankMembers": bankMembers.flatMap { (value: [BankMember?]) -> [ResultMap?] in value.map { (value: BankMember?) -> ResultMap? in value.flatMap { (value: BankMember) -> ResultMap in value.resultMap } } }])
    }

    public var bankMembers: [BankMember?]? {
      get {
        return (resultMap["bankMembers"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [BankMember?] in value.map { (value: ResultMap?) -> BankMember? in value.flatMap { (value: ResultMap) -> BankMember in BankMember(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [BankMember?]) -> [ResultMap?] in value.map { (value: BankMember?) -> ResultMap? in value.flatMap { (value: BankMember) -> ResultMap in value.resultMap } } }, forKey: "bankMembers")
      }
    }

    public struct BankMember: GraphQLSelectionSet {
      public static let possibleTypes = ["BankMember"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("bankAccounts", type: .list(.object(BankAccount.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, status: String? = nil, bankAccounts: [BankAccount?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "BankMember", "id": id, "name": name, "status": status, "bankAccounts": bankAccounts.flatMap { (value: [BankAccount?]) -> [ResultMap?] in value.map { (value: BankAccount?) -> ResultMap? in value.flatMap { (value: BankAccount) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var status: String? {
        get {
          return resultMap["status"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var bankAccounts: [BankAccount?]? {
        get {
          return (resultMap["bankAccounts"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [BankAccount?] in value.map { (value: ResultMap?) -> BankAccount? in value.flatMap { (value: ResultMap) -> BankAccount in BankAccount(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [BankAccount?]) -> [ResultMap?] in value.map { (value: BankAccount?) -> ResultMap? in value.flatMap { (value: BankAccount) -> ResultMap in value.resultMap } } }, forKey: "bankAccounts")
        }
      }

      public struct BankAccount: GraphQLSelectionSet {
        public static let possibleTypes = ["BankAccount"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("sync", type: .scalar(Bool.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, sync: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "BankAccount", "id": id, "name": name, "sync": sync])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var sync: Bool? {
          get {
            return resultMap["sync"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "sync")
          }
        }
      }
    }
  }
}
