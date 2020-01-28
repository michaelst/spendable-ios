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

public final class ListBudgetsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query ListBudgets {
      budgets {
        __typename
        id
        name
        balance
        goal
      }
    }
    """

  public let operationName = "ListBudgets"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootQueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("budgets", type: .list(.object(Budget.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(budgets: [Budget?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "budgets": budgets.flatMap { (value: [Budget?]) -> [ResultMap?] in value.map { (value: Budget?) -> ResultMap? in value.flatMap { (value: Budget) -> ResultMap in value.resultMap } } }])
    }

    public var budgets: [Budget?]? {
      get {
        return (resultMap["budgets"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Budget?] in value.map { (value: ResultMap?) -> Budget? in value.flatMap { (value: ResultMap) -> Budget in Budget(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Budget?]) -> [ResultMap?] in value.map { (value: Budget?) -> ResultMap? in value.flatMap { (value: Budget) -> ResultMap in value.resultMap } } }, forKey: "budgets")
      }
    }

    public struct Budget: GraphQLSelectionSet {
      public static let possibleTypes = ["Budget"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("balance", type: .scalar(String.self)),
        GraphQLField("goal", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, balance: String? = nil, goal: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Budget", "id": id, "name": name, "balance": balance, "goal": goal])
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

      public var balance: String? {
        get {
          return resultMap["balance"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "balance")
        }
      }

      public var goal: String? {
        get {
          return resultMap["goal"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "goal")
        }
      }
    }
  }
}

public final class CreateBudgetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation CreateBudget($name: String!, $balance: String!, $goal: String) {
      createBudget(name: $name, balance: $balance, goal: $goal) {
        __typename
        id
        name
        balance
        goal
      }
    }
    """

  public let operationName = "CreateBudget"

  public var name: String
  public var balance: String
  public var goal: String?

  public init(name: String, balance: String, goal: String? = nil) {
    self.name = name
    self.balance = balance
    self.goal = goal
  }

  public var variables: GraphQLMap? {
    return ["name": name, "balance": balance, "goal": goal]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createBudget", arguments: ["name": GraphQLVariable("name"), "balance": GraphQLVariable("balance"), "goal": GraphQLVariable("goal")], type: .object(CreateBudget.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createBudget: CreateBudget? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "createBudget": createBudget.flatMap { (value: CreateBudget) -> ResultMap in value.resultMap }])
    }

    public var createBudget: CreateBudget? {
      get {
        return (resultMap["createBudget"] as? ResultMap).flatMap { CreateBudget(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createBudget")
      }
    }

    public struct CreateBudget: GraphQLSelectionSet {
      public static let possibleTypes = ["Budget"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("balance", type: .scalar(String.self)),
        GraphQLField("goal", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, balance: String? = nil, goal: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Budget", "id": id, "name": name, "balance": balance, "goal": goal])
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

      public var balance: String? {
        get {
          return resultMap["balance"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "balance")
        }
      }

      public var goal: String? {
        get {
          return resultMap["goal"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "goal")
        }
      }
    }
  }
}

public final class UpdateBugdetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation UpdateBugdet($id: ID!, $name: String!, $balance: String!, $goal: String) {
      updateBudget(id: $id, name: $name, balance: $balance, goal: $goal) {
        __typename
        id
      }
    }
    """

  public let operationName = "UpdateBugdet"

  public var id: GraphQLID
  public var name: String
  public var balance: String
  public var goal: String?

  public init(id: GraphQLID, name: String, balance: String, goal: String? = nil) {
    self.id = id
    self.name = name
    self.balance = balance
    self.goal = goal
  }

  public var variables: GraphQLMap? {
    return ["id": id, "name": name, "balance": balance, "goal": goal]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateBudget", arguments: ["id": GraphQLVariable("id"), "name": GraphQLVariable("name"), "balance": GraphQLVariable("balance"), "goal": GraphQLVariable("goal")], type: .object(UpdateBudget.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateBudget: UpdateBudget? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "updateBudget": updateBudget.flatMap { (value: UpdateBudget) -> ResultMap in value.resultMap }])
    }

    public var updateBudget: UpdateBudget? {
      get {
        return (resultMap["updateBudget"] as? ResultMap).flatMap { UpdateBudget(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateBudget")
      }
    }

    public struct UpdateBudget: GraphQLSelectionSet {
      public static let possibleTypes = ["Budget"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil) {
        self.init(unsafeResultMap: ["__typename": "Budget", "id": id])
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

public final class DeleteBudgetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation DeleteBudget($id: ID!) {
      deleteBudget(id: $id) {
        __typename
        id
      }
    }
    """

  public let operationName = "DeleteBudget"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteBudget", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteBudget.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteBudget: DeleteBudget? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "deleteBudget": deleteBudget.flatMap { (value: DeleteBudget) -> ResultMap in value.resultMap }])
    }

    public var deleteBudget: DeleteBudget? {
      get {
        return (resultMap["deleteBudget"] as? ResultMap).flatMap { DeleteBudget(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteBudget")
      }
    }

    public struct DeleteBudget: GraphQLSelectionSet {
      public static let possibleTypes = ["Budget"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil) {
        self.init(unsafeResultMap: ["__typename": "Budget", "id": id])
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

public final class ListTransactionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query ListTransactions {
      transactions {
        __typename
        id
        name
        note
        amount
        date
        budget {
          __typename
          id
        }
        category {
          __typename
          id
        }
      }
    }
    """

  public let operationName = "ListTransactions"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootQueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("transactions", type: .list(.object(Transaction.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(transactions: [Transaction?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "transactions": transactions.flatMap { (value: [Transaction?]) -> [ResultMap?] in value.map { (value: Transaction?) -> ResultMap? in value.flatMap { (value: Transaction) -> ResultMap in value.resultMap } } }])
    }

    public var transactions: [Transaction?]? {
      get {
        return (resultMap["transactions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Transaction?] in value.map { (value: ResultMap?) -> Transaction? in value.flatMap { (value: ResultMap) -> Transaction in Transaction(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Transaction?]) -> [ResultMap?] in value.map { (value: Transaction?) -> ResultMap? in value.flatMap { (value: Transaction) -> ResultMap in value.resultMap } } }, forKey: "transactions")
      }
    }

    public struct Transaction: GraphQLSelectionSet {
      public static let possibleTypes = ["Transaction"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("note", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(String.self)),
        GraphQLField("date", type: .scalar(String.self)),
        GraphQLField("budget", type: .object(Budget.selections)),
        GraphQLField("category", type: .object(Category.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, note: String? = nil, amount: String? = nil, date: String? = nil, budget: Budget? = nil, category: Category? = nil) {
        self.init(unsafeResultMap: ["__typename": "Transaction", "id": id, "name": name, "note": note, "amount": amount, "date": date, "budget": budget.flatMap { (value: Budget) -> ResultMap in value.resultMap }, "category": category.flatMap { (value: Category) -> ResultMap in value.resultMap }])
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

      public var note: String? {
        get {
          return resultMap["note"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "note")
        }
      }

      public var amount: String? {
        get {
          return resultMap["amount"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var date: String? {
        get {
          return resultMap["date"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date")
        }
      }

      public var budget: Budget? {
        get {
          return (resultMap["budget"] as? ResultMap).flatMap { Budget(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "budget")
        }
      }

      public var category: Category? {
        get {
          return (resultMap["category"] as? ResultMap).flatMap { Category(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "category")
        }
      }

      public struct Budget: GraphQLSelectionSet {
        public static let possibleTypes = ["Budget"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil) {
          self.init(unsafeResultMap: ["__typename": "Budget", "id": id])
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

      public struct Category: GraphQLSelectionSet {
        public static let possibleTypes = ["Category"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil) {
          self.init(unsafeResultMap: ["__typename": "Category", "id": id])
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
}

public final class ListCategoriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query ListCategories {
      categories {
        __typename
        id
        name
        parentName
      }
    }
    """

  public let operationName = "ListCategories"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootQueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("categories", type: .list(.object(Category.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(categories: [Category?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "categories": categories.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }])
    }

    public var categories: [Category?]? {
      get {
        return (resultMap["categories"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Category?] in value.map { (value: ResultMap?) -> Category? in value.flatMap { (value: ResultMap) -> Category in Category(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, forKey: "categories")
      }
    }

    public struct Category: GraphQLSelectionSet {
      public static let possibleTypes = ["Category"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("parentName", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, parentName: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name, "parentName": parentName])
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

      public var parentName: String? {
        get {
          return resultMap["parentName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "parentName")
        }
      }
    }
  }
}

public final class UpdateTransactionMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation UpdateTransaction($id: ID!, $name: String, $note: String, $categoryId: ID, $budgetId: ID) {
      updateTransaction(id: $id, name: $name, note: $note, categoryId: $categoryId, budgetId: $budgetId) {
        __typename
        id
      }
    }
    """

  public let operationName = "UpdateTransaction"

  public var id: GraphQLID
  public var name: String?
  public var note: String?
  public var categoryId: GraphQLID?
  public var budgetId: GraphQLID?

  public init(id: GraphQLID, name: String? = nil, note: String? = nil, categoryId: GraphQLID? = nil, budgetId: GraphQLID? = nil) {
    self.id = id
    self.name = name
    self.note = note
    self.categoryId = categoryId
    self.budgetId = budgetId
  }

  public var variables: GraphQLMap? {
    return ["id": id, "name": name, "note": note, "categoryId": categoryId, "budgetId": budgetId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateTransaction", arguments: ["id": GraphQLVariable("id"), "name": GraphQLVariable("name"), "note": GraphQLVariable("note"), "categoryId": GraphQLVariable("categoryId"), "budgetId": GraphQLVariable("budgetId")], type: .object(UpdateTransaction.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateTransaction: UpdateTransaction? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "updateTransaction": updateTransaction.flatMap { (value: UpdateTransaction) -> ResultMap in value.resultMap }])
    }

    public var updateTransaction: UpdateTransaction? {
      get {
        return (resultMap["updateTransaction"] as? ResultMap).flatMap { UpdateTransaction(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateTransaction")
      }
    }

    public struct UpdateTransaction: GraphQLSelectionSet {
      public static let possibleTypes = ["Transaction"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil) {
        self.init(unsafeResultMap: ["__typename": "Transaction", "id": id])
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

public final class CurrentUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query CurrentUser {
      currentUser {
        __typename
        email
      }
    }
    """

  public let operationName = "CurrentUser"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootQueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("currentUser", type: .object(CurrentUser.selections)),
    ]

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
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(email: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "email": email])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation Login($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        __typename
        token
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
        GraphQLField("email", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String? = nil, email: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "token": token, "email": email])
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
    mutation CreateUser($email: String!, $password: String!) {
      createUser(email: $email, password: $password) {
        __typename
        token
      }
    }
    """

  public let operationName = "CreateUser"

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
      GraphQLField("createUser", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(CreateUser.selections)),
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

public final class UpdateCurrentUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation UpdateCurrentUser($email: String!) {
      updateUser(email: $email) {
        __typename
        email
      }
    }
    """

  public let operationName = "UpdateCurrentUser"

  public var email: String

  public init(email: String) {
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUser", arguments: ["email": GraphQLVariable("email")], type: .object(UpdateUser.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateUser: UpdateUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "updateUser": updateUser.flatMap { (value: UpdateUser) -> ResultMap in value.resultMap }])
    }

    public var updateUser: UpdateUser? {
      get {
        return (resultMap["updateUser"] as? ResultMap).flatMap { UpdateUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateUser")
      }
    }

    public struct UpdateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(email: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "email": email])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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
