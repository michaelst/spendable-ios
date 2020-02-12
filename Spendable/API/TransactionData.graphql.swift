//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ListTransactionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query ListTransactions($offset: Int) {
      transactions(offset: $offset) {
        __typename
        id
        name
        note
        amount
        date
        allocations {
          __typename
          id
          budget {
            __typename
            id
          }
          amount
        }
        category {
          __typename
          id
        }
        bankTransaction {
          __typename
          pending
        }
      }
    }
    """

  public let operationName = "ListTransactions"

  public var offset: Int?

  public init(offset: Int? = nil) {
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootQueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("transactions", arguments: ["offset": GraphQLVariable("offset")], type: .list(.object(Transaction.selections))),
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
        GraphQLField("allocations", type: .list(.object(Allocation.selections))),
        GraphQLField("category", type: .object(Category.selections)),
        GraphQLField("bankTransaction", type: .object(BankTransaction.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, note: String? = nil, amount: String? = nil, date: String? = nil, allocations: [Allocation?]? = nil, category: Category? = nil, bankTransaction: BankTransaction? = nil) {
        self.init(unsafeResultMap: ["__typename": "Transaction", "id": id, "name": name, "note": note, "amount": amount, "date": date, "allocations": allocations.flatMap { (value: [Allocation?]) -> [ResultMap?] in value.map { (value: Allocation?) -> ResultMap? in value.flatMap { (value: Allocation) -> ResultMap in value.resultMap } } }, "category": category.flatMap { (value: Category) -> ResultMap in value.resultMap }, "bankTransaction": bankTransaction.flatMap { (value: BankTransaction) -> ResultMap in value.resultMap }])
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

      public var allocations: [Allocation?]? {
        get {
          return (resultMap["allocations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Allocation?] in value.map { (value: ResultMap?) -> Allocation? in value.flatMap { (value: ResultMap) -> Allocation in Allocation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Allocation?]) -> [ResultMap?] in value.map { (value: Allocation?) -> ResultMap? in value.flatMap { (value: Allocation) -> ResultMap in value.resultMap } } }, forKey: "allocations")
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

      public var bankTransaction: BankTransaction? {
        get {
          return (resultMap["bankTransaction"] as? ResultMap).flatMap { BankTransaction(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "bankTransaction")
        }
      }

      public struct Allocation: GraphQLSelectionSet {
        public static let possibleTypes = ["Allocation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("budget", type: .object(Budget.selections)),
          GraphQLField("amount", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, budget: Budget? = nil, amount: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Allocation", "id": id, "budget": budget.flatMap { (value: Budget) -> ResultMap in value.resultMap }, "amount": amount])
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

        public var budget: Budget? {
          get {
            return (resultMap["budget"] as? ResultMap).flatMap { Budget(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "budget")
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

      public struct BankTransaction: GraphQLSelectionSet {
        public static let possibleTypes = ["BankTransaction"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pending", type: .scalar(Bool.self)),
        ]

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
}

public final class GetTransactionQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query GetTransaction($id: ID!) {
      transaction(id: $id) {
        __typename
        name
        note
        amount
        date
        allocations {
          __typename
          id
          budget {
            __typename
            id
          }
          amount
        }
        category {
          __typename
          id
        }
        bankTransaction {
          __typename
          pending
        }
      }
    }
    """

  public let operationName = "GetTransaction"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootQueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("transaction", arguments: ["id": GraphQLVariable("id")], type: .object(Transaction.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(transaction: Transaction? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "transaction": transaction.flatMap { (value: Transaction) -> ResultMap in value.resultMap }])
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
      public static let possibleTypes = ["Transaction"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("note", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(String.self)),
        GraphQLField("date", type: .scalar(String.self)),
        GraphQLField("allocations", type: .list(.object(Allocation.selections))),
        GraphQLField("category", type: .object(Category.selections)),
        GraphQLField("bankTransaction", type: .object(BankTransaction.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, note: String? = nil, amount: String? = nil, date: String? = nil, allocations: [Allocation?]? = nil, category: Category? = nil, bankTransaction: BankTransaction? = nil) {
        self.init(unsafeResultMap: ["__typename": "Transaction", "name": name, "note": note, "amount": amount, "date": date, "allocations": allocations.flatMap { (value: [Allocation?]) -> [ResultMap?] in value.map { (value: Allocation?) -> ResultMap? in value.flatMap { (value: Allocation) -> ResultMap in value.resultMap } } }, "category": category.flatMap { (value: Category) -> ResultMap in value.resultMap }, "bankTransaction": bankTransaction.flatMap { (value: BankTransaction) -> ResultMap in value.resultMap }])
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

      public var allocations: [Allocation?]? {
        get {
          return (resultMap["allocations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Allocation?] in value.map { (value: ResultMap?) -> Allocation? in value.flatMap { (value: ResultMap) -> Allocation in Allocation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Allocation?]) -> [ResultMap?] in value.map { (value: Allocation?) -> ResultMap? in value.flatMap { (value: Allocation) -> ResultMap in value.resultMap } } }, forKey: "allocations")
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

      public var bankTransaction: BankTransaction? {
        get {
          return (resultMap["bankTransaction"] as? ResultMap).flatMap { BankTransaction(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "bankTransaction")
        }
      }

      public struct Allocation: GraphQLSelectionSet {
        public static let possibleTypes = ["Allocation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("budget", type: .object(Budget.selections)),
          GraphQLField("amount", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, budget: Budget? = nil, amount: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Allocation", "id": id, "budget": budget.flatMap { (value: Budget) -> ResultMap in value.resultMap }, "amount": amount])
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

        public var budget: Budget? {
          get {
            return (resultMap["budget"] as? ResultMap).flatMap { Budget(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "budget")
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

      public struct BankTransaction: GraphQLSelectionSet {
        public static let possibleTypes = ["BankTransaction"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pending", type: .scalar(Bool.self)),
        ]

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
    mutation UpdateTransaction($id: ID!, $amount: String!, $name: String, $date: String, $note: String, $categoryId: ID, $allocations: [AllocationInputObject]) {
      updateTransaction(id: $id, amount: $amount, name: $name, date: $date, note: $note, categoryId: $categoryId, allocations: $allocations) {
        __typename
        id
      }
    }
    """

  public let operationName = "UpdateTransaction"

  public var id: GraphQLID
  public var amount: String
  public var name: String?
  public var date: String?
  public var note: String?
  public var categoryId: GraphQLID?
  public var allocations: [AllocationInputObject?]?

  public init(id: GraphQLID, amount: String, name: String? = nil, date: String? = nil, note: String? = nil, categoryId: GraphQLID? = nil, allocations: [AllocationInputObject?]? = nil) {
    self.id = id
    self.amount = amount
    self.name = name
    self.date = date
    self.note = note
    self.categoryId = categoryId
    self.allocations = allocations
  }

  public var variables: GraphQLMap? {
    return ["id": id, "amount": amount, "name": name, "date": date, "note": note, "categoryId": categoryId, "allocations": allocations]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateTransaction", arguments: ["id": GraphQLVariable("id"), "amount": GraphQLVariable("amount"), "name": GraphQLVariable("name"), "date": GraphQLVariable("date"), "note": GraphQLVariable("note"), "categoryId": GraphQLVariable("categoryId"), "allocations": GraphQLVariable("allocations")], type: .object(UpdateTransaction.selections)),
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
