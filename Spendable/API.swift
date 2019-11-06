//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation Login($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        __typename
        token
        firstName
        lastName
        email
      }
    }
    """

  public let operationName = "Login"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(Login.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "login": login.flatMap { (value: Login) -> ResultMap in value.resultMap }])
    }

    public var login: Login? {
      get {
        return (resultMap["login"] as? ResultMap).flatMap { Login(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .scalar(String.self)),
        GraphQLField("firstName", type: .scalar(String.self)),
        GraphQLField("lastName", type: .scalar(String.self)),
        GraphQLField("email", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "token": token, "firstName": firstName, "lastName": lastName, "email": email])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public var firstName: String? {
        get {
          return resultMap["firstName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String? {
        get {
          return resultMap["lastName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation CreateUser($firstName: String, $lastName: String, $email: String!, $password: String!) {
      createUser(firstName: $firstName, lastName: $lastName, email: $email, password: $password) {
        __typename
        token
      }
    }
    """

  public let operationName = "CreateUser"

  public var firstName: String?
  public var lastName: String?
  public var email: String
  public var password: String

  public init(firstName: String? = nil, lastName: String? = nil, email: String, password: String) {
    self.firstName = firstName
    self.lastName = lastName
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["firstName": firstName, "lastName": lastName, "email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["firstName": GraphQLVariable("firstName"), "lastName": GraphQLVariable("lastName"), "email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(CreateUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "createUser": createUser.flatMap { (value: CreateUser) -> ResultMap in value.resultMap }])
    }

    public var createUser: CreateUser? {
      get {
        return (resultMap["createUser"] as? ResultMap).flatMap { CreateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}

public final class CreateBankMemberMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation CreateBankMember($publicToken: String!) {
      createBankMember(publicToken: $publicToken) {
        __typename
        id
        externalId
        name
        logo
        status
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
        GraphQLField("externalId", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("logo", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, externalId: String? = nil, name: String? = nil, logo: String? = nil, status: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "BankMember", "id": id, "externalId": externalId, "name": name, "logo": logo, "status": status])
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

      public var externalId: String? {
        get {
          return resultMap["externalId"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "externalId")
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

      public var logo: String? {
        get {
          return resultMap["logo"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "logo")
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
    }
  }
}

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
