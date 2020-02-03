//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CreateBankMemberMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation CreateBankMember($publicToken: String!) {
      createBankMember(publicToken: $publicToken) {
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

  public let operationName = "CreateBankMember"

  public var publicToken: String

  public init(publicToken: String) {
    self.publicToken = publicToken
  }

  public var variables: GraphQLMap? {
    return ["publicToken": publicToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createBankMember", arguments: ["publicToken": GraphQLVariable("publicToken")], type: .object(CreateBankMember.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createBankMember: CreateBankMember? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "createBankMember": createBankMember.flatMap { (value: CreateBankMember) -> ResultMap in value.resultMap }])
    }

    public var createBankMember: CreateBankMember? {
      get {
        return (resultMap["createBankMember"] as? ResultMap).flatMap { CreateBankMember(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createBankMember")
      }
    }

    public struct CreateBankMember: GraphQLSelectionSet {
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

public final class UpdateBankAccountMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation UpdateBankAccount($id: ID!, $sync: Boolean!) {
      updateBankAccount(id: $id, sync: $sync) {
        __typename
        id
      }
    }
    """

  public let operationName = "UpdateBankAccount"

  public var id: GraphQLID
  public var sync: Bool

  public init(id: GraphQLID, sync: Bool) {
    self.id = id
    self.sync = sync
  }

  public var variables: GraphQLMap? {
    return ["id": id, "sync": sync]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateBankAccount", arguments: ["id": GraphQLVariable("id"), "sync": GraphQLVariable("sync")], type: .object(UpdateBankAccount.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateBankAccount: UpdateBankAccount? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "updateBankAccount": updateBankAccount.flatMap { (value: UpdateBankAccount) -> ResultMap in value.resultMap }])
    }

    public var updateBankAccount: UpdateBankAccount? {
      get {
        return (resultMap["updateBankAccount"] as? ResultMap).flatMap { UpdateBankAccount(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateBankAccount")
      }
    }

    public struct UpdateBankAccount: GraphQLSelectionSet {
      public static let possibleTypes = ["BankAccount"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil) {
        self.init(unsafeResultMap: ["__typename": "BankAccount", "id": id])
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
    }
  }
}
