// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CurrentUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CurrentUser {
      currentUser {
        __typename
        bankLimit
        spendable
      }
    }
    """

  public let operationName: String = "CurrentUser"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootQueryType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("currentUser", type: .object(CurrentUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(currentUser: CurrentUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "currentUser": currentUser.flatMap { (value: CurrentUser) -> ResultMap in value.resultMap }])
    }

    public var currentUser: CurrentUser? {
      get {
        return (resultMap["currentUser"] as? ResultMap).flatMap { CurrentUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "currentUser")
      }
    }

    public struct CurrentUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("bankLimit", type: .scalar(Int.self)),
          GraphQLField("spendable", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(bankLimit: Int? = nil, spendable: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "bankLimit": bankLimit, "spendable": spendable])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var bankLimit: Int? {
        get {
          return resultMap["bankLimit"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "bankLimit")
        }
      }

      public var spendable: String? {
        get {
          return resultMap["spendable"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "spendable")
        }
      }
    }
  }
}

public final class SignInWithAppleMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SignInWithApple($token: String!) {
      signInWithApple(token: $token) {
        __typename
        token
        bankLimit
        spendable
      }
    }
    """

  public let operationName: String = "SignInWithApple"

  public var token: String

  public init(token: String) {
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signInWithApple", arguments: ["token": GraphQLVariable("token")], type: .object(SignInWithApple.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signInWithApple: SignInWithApple? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "signInWithApple": signInWithApple.flatMap { (value: SignInWithApple) -> ResultMap in value.resultMap }])
    }

    public var signInWithApple: SignInWithApple? {
      get {
        return (resultMap["signInWithApple"] as? ResultMap).flatMap { SignInWithApple(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "signInWithApple")
      }
    }

    public struct SignInWithApple: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .scalar(String.self)),
          GraphQLField("bankLimit", type: .scalar(Int.self)),
          GraphQLField("spendable", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil, bankLimit: Int? = nil, spendable: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "token": token, "bankLimit": bankLimit, "spendable": spendable])
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

      public var bankLimit: Int? {
        get {
          return resultMap["bankLimit"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "bankLimit")
        }
      }

      public var spendable: String? {
        get {
          return resultMap["spendable"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "spendable")
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        __typename
        token
        bankLimit
        spendable
      }
    }
    """

  public let operationName: String = "Login"

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
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(Login.selections)),
      ]
    }

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
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .scalar(String.self)),
          GraphQLField("bankLimit", type: .scalar(Int.self)),
          GraphQLField("spendable", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil, bankLimit: Int? = nil, spendable: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "token": token, "bankLimit": bankLimit, "spendable": spendable])
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

      public var bankLimit: Int? {
        get {
          return resultMap["bankLimit"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "bankLimit")
        }
      }

      public var spendable: String? {
        get {
          return resultMap["spendable"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "spendable")
        }
      }
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateUser($email: String!, $password: String!) {
      createUser(email: $email, password: $password) {
        __typename
        token
        bankLimit
        spendable
      }
    }
    """

  public let operationName: String = "CreateUser"

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
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createUser", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(CreateUser.selections)),
      ]
    }

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
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("token", type: .scalar(String.self)),
          GraphQLField("bankLimit", type: .scalar(Int.self)),
          GraphQLField("spendable", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil, bankLimit: Int? = nil, spendable: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "token": token, "bankLimit": bankLimit, "spendable": spendable])
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

      public var bankLimit: Int? {
        get {
          return resultMap["bankLimit"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "bankLimit")
        }
      }

      public var spendable: String? {
        get {
          return resultMap["spendable"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "spendable")
        }
      }
    }
  }
}
