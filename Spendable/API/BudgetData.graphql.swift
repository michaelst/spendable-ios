//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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
    mutation CreateBudget($name: String!, $goal: String) {
      createBudget(name: $name, goal: $goal) {
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
  public var goal: String?

  public init(name: String, goal: String? = nil) {
    self.name = name
    self.goal = goal
  }

  public var variables: GraphQLMap? {
    return ["name": name, "goal": goal]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createBudget", arguments: ["name": GraphQLVariable("name"), "goal": GraphQLVariable("goal")], type: .object(CreateBudget.selections)),
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

public final class UpdateBudgetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation UpdateBudget($id: ID!, $name: String!, $balance: String!, $goal: String) {
      updateBudget(id: $id, name: $name, balance: $balance, goal: $goal) {
        __typename
        id
        name
        balance
        goal
      }
    }
    """

  public let operationName = "UpdateBudget"

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
