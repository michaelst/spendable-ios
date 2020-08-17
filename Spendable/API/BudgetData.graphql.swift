// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ListBudgetsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
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

  public let operationName: String = "ListBudgets"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootQueryType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("budgets", type: .list(.object(Budget.selections))),
      ]
    }

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
      public static let possibleTypes: [String] = ["Budget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("balance", type: .scalar(String.self)),
          GraphQLField("goal", type: .scalar(String.self)),
        ]
      }

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

public final class GetBudgetQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetBudget($id: ID!) {
      budget(id: $id) {
        __typename
        id
        name
        balance
        goal
        recentAllocations {
          __typename
          id
          amount
          transaction {
            __typename
            name
            date
            bankTransaction {
              __typename
              pending
            }
          }
        }
        allocationTemplateLines {
          __typename
          id
          amount
          allocationTemplate {
            __typename
            name
          }
        }
      }
    }
    """

  public let operationName: String = "GetBudget"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootQueryType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("budget", arguments: ["id": GraphQLVariable("id")], type: .object(Budget.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(budget: Budget? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "budget": budget.flatMap { (value: Budget) -> ResultMap in value.resultMap }])
    }

    public var budget: Budget? {
      get {
        return (resultMap["budget"] as? ResultMap).flatMap { Budget(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "budget")
      }
    }

    public struct Budget: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Budget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("balance", type: .scalar(String.self)),
          GraphQLField("goal", type: .scalar(String.self)),
          GraphQLField("recentAllocations", type: .list(.object(RecentAllocation.selections))),
          GraphQLField("allocationTemplateLines", type: .list(.object(AllocationTemplateLine.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, balance: String? = nil, goal: String? = nil, recentAllocations: [RecentAllocation?]? = nil, allocationTemplateLines: [AllocationTemplateLine?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Budget", "id": id, "name": name, "balance": balance, "goal": goal, "recentAllocations": recentAllocations.flatMap { (value: [RecentAllocation?]) -> [ResultMap?] in value.map { (value: RecentAllocation?) -> ResultMap? in value.flatMap { (value: RecentAllocation) -> ResultMap in value.resultMap } } }, "allocationTemplateLines": allocationTemplateLines.flatMap { (value: [AllocationTemplateLine?]) -> [ResultMap?] in value.map { (value: AllocationTemplateLine?) -> ResultMap? in value.flatMap { (value: AllocationTemplateLine) -> ResultMap in value.resultMap } } }])
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

      public var recentAllocations: [RecentAllocation?]? {
        get {
          return (resultMap["recentAllocations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RecentAllocation?] in value.map { (value: ResultMap?) -> RecentAllocation? in value.flatMap { (value: ResultMap) -> RecentAllocation in RecentAllocation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [RecentAllocation?]) -> [ResultMap?] in value.map { (value: RecentAllocation?) -> ResultMap? in value.flatMap { (value: RecentAllocation) -> ResultMap in value.resultMap } } }, forKey: "recentAllocations")
        }
      }

      public var allocationTemplateLines: [AllocationTemplateLine?]? {
        get {
          return (resultMap["allocationTemplateLines"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AllocationTemplateLine?] in value.map { (value: ResultMap?) -> AllocationTemplateLine? in value.flatMap { (value: ResultMap) -> AllocationTemplateLine in AllocationTemplateLine(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [AllocationTemplateLine?]) -> [ResultMap?] in value.map { (value: AllocationTemplateLine?) -> ResultMap? in value.flatMap { (value: AllocationTemplateLine) -> ResultMap in value.resultMap } } }, forKey: "allocationTemplateLines")
        }
      }

      public struct RecentAllocation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Allocation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("amount", type: .scalar(String.self)),
            GraphQLField("transaction", type: .object(Transaction.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, amount: String? = nil, transaction: Transaction? = nil) {
          self.init(unsafeResultMap: ["__typename": "Allocation", "id": id, "amount": amount, "transaction": transaction.flatMap { (value: Transaction) -> ResultMap in value.resultMap }])
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

        public var amount: String? {
          get {
            return resultMap["amount"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }

        public var transaction: Transaction? {
          get {
            return (resultMap["transaction"] as? ResultMap).flatMap { Transaction(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "transaction")
          }
        }

        public struct Transaction: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Transaction"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("date", type: .scalar(String.self)),
              GraphQLField("bankTransaction", type: .object(BankTransaction.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, date: String? = nil, bankTransaction: BankTransaction? = nil) {
            self.init(unsafeResultMap: ["__typename": "Transaction", "name": name, "date": date, "bankTransaction": bankTransaction.flatMap { (value: BankTransaction) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          public var date: String? {
            get {
              return resultMap["date"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "date")
            }
          }

          public var bankTransaction: BankTransaction? {
            get {
              return (resultMap["bankTransaction"] as? ResultMap).flatMap { BankTransaction(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "bankTransaction")
            }
          }

          public struct BankTransaction: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["BankTransaction"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("pending", type: .scalar(Bool.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(pending: Bool? = nil) {
              self.init(unsafeResultMap: ["__typename": "BankTransaction", "pending": pending])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var pending: Bool? {
              get {
                return resultMap["pending"] as? Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "pending")
              }
            }
          }
        }
      }

      public struct AllocationTemplateLine: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AllocationTemplateLine"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("amount", type: .scalar(String.self)),
            GraphQLField("allocationTemplate", type: .object(AllocationTemplate.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, amount: String? = nil, allocationTemplate: AllocationTemplate? = nil) {
          self.init(unsafeResultMap: ["__typename": "AllocationTemplateLine", "id": id, "amount": amount, "allocationTemplate": allocationTemplate.flatMap { (value: AllocationTemplate) -> ResultMap in value.resultMap }])
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

        public var amount: String? {
          get {
            return resultMap["amount"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }

        public var allocationTemplate: AllocationTemplate? {
          get {
            return (resultMap["allocationTemplate"] as? ResultMap).flatMap { AllocationTemplate(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "allocationTemplate")
          }
        }

        public struct AllocationTemplate: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["AllocationTemplate"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "AllocationTemplate", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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
        }
      }
    }
  }
}

public final class CreateBudgetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateBudget($name: String!, $balance: String, $goal: String) {
      createBudget(name: $name, balance: $balance, goal: $goal) {
        __typename
        id
        name
        balance
        goal
      }
    }
    """

  public let operationName: String = "CreateBudget"

  public var name: String
  public var balance: String?
  public var goal: String?

  public init(name: String, balance: String? = nil, goal: String? = nil) {
    self.name = name
    self.balance = balance
    self.goal = goal
  }

  public var variables: GraphQLMap? {
    return ["name": name, "balance": balance, "goal": goal]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createBudget", arguments: ["name": GraphQLVariable("name"), "balance": GraphQLVariable("balance"), "goal": GraphQLVariable("goal")], type: .object(CreateBudget.selections)),
      ]
    }

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
      public static let possibleTypes: [String] = ["Budget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("balance", type: .scalar(String.self)),
          GraphQLField("goal", type: .scalar(String.self)),
        ]
      }

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

public final class UpdateBudgetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateBudget($id: ID!, $name: String!, $balance: String, $goal: String) {
      updateBudget(id: $id, name: $name, balance: $balance, goal: $goal) {
        __typename
        id
        name
        balance
        goal
      }
    }
    """

  public let operationName: String = "UpdateBudget"

  public var id: GraphQLID
  public var name: String
  public var balance: String?
  public var goal: String?

  public init(id: GraphQLID, name: String, balance: String? = nil, goal: String? = nil) {
    self.id = id
    self.name = name
    self.balance = balance
    self.goal = goal
  }

  public var variables: GraphQLMap? {
    return ["id": id, "name": name, "balance": balance, "goal": goal]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateBudget", arguments: ["id": GraphQLVariable("id"), "name": GraphQLVariable("name"), "balance": GraphQLVariable("balance"), "goal": GraphQLVariable("goal")], type: .object(UpdateBudget.selections)),
      ]
    }

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
      public static let possibleTypes: [String] = ["Budget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("balance", type: .scalar(String.self)),
          GraphQLField("goal", type: .scalar(String.self)),
        ]
      }

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

public final class DeleteBudgetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteBudget($id: ID!) {
      deleteBudget(id: $id) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "DeleteBudget"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteBudget", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteBudget.selections)),
      ]
    }

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
      public static let possibleTypes: [String] = ["Budget"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
        ]
      }

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
