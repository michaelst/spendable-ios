// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ListAllocationTemplatesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ListAllocationTemplates {
      allocationTemplates {
        __typename
        id
        name
        lines {
          __typename
          id
          amount
          budget {
            __typename
            id
          }
        }
      }
    }
    """

  public let operationName: String = "ListAllocationTemplates"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootQueryType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allocationTemplates", type: .list(.object(AllocationTemplate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allocationTemplates: [AllocationTemplate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "allocationTemplates": allocationTemplates.flatMap { (value: [AllocationTemplate?]) -> [ResultMap?] in value.map { (value: AllocationTemplate?) -> ResultMap? in value.flatMap { (value: AllocationTemplate) -> ResultMap in value.resultMap } } }])
    }

    public var allocationTemplates: [AllocationTemplate?]? {
      get {
        return (resultMap["allocationTemplates"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AllocationTemplate?] in value.map { (value: ResultMap?) -> AllocationTemplate? in value.flatMap { (value: ResultMap) -> AllocationTemplate in AllocationTemplate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [AllocationTemplate?]) -> [ResultMap?] in value.map { (value: AllocationTemplate?) -> ResultMap? in value.flatMap { (value: AllocationTemplate) -> ResultMap in value.resultMap } } }, forKey: "allocationTemplates")
      }
    }

    public struct AllocationTemplate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AllocationTemplate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("lines", type: .list(.object(Line.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, lines: [Line?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "AllocationTemplate", "id": id, "name": name, "lines": lines.flatMap { (value: [Line?]) -> [ResultMap?] in value.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } } }])
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

      public var lines: [Line?]? {
        get {
          return (resultMap["lines"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Line?] in value.map { (value: ResultMap?) -> Line? in value.flatMap { (value: ResultMap) -> Line in Line(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Line?]) -> [ResultMap?] in value.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } } }, forKey: "lines")
        }
      }

      public struct Line: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AllocationTemplateLine"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("amount", type: .scalar(String.self)),
            GraphQLField("budget", type: .object(Budget.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, amount: String? = nil, budget: Budget? = nil) {
          self.init(unsafeResultMap: ["__typename": "AllocationTemplateLine", "id": id, "amount": amount, "budget": budget.flatMap { (value: Budget) -> ResultMap in value.resultMap }])
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
  }
}

public final class CreateAllocationTemplateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateAllocationTemplate($name: String!, $lines: [AllocationTemplateLineInputObject]) {
      createAllocationTemplate(name: $name, lines: $lines) {
        __typename
        id
        name
        lines {
          __typename
          id
          amount
          budget {
            __typename
            id
          }
        }
      }
    }
    """

  public let operationName: String = "CreateAllocationTemplate"

  public var name: String
  public var lines: [AllocationTemplateLineInputObject?]?

  public init(name: String, lines: [AllocationTemplateLineInputObject?]? = nil) {
    self.name = name
    self.lines = lines
  }

  public var variables: GraphQLMap? {
    return ["name": name, "lines": lines]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createAllocationTemplate", arguments: ["name": GraphQLVariable("name"), "lines": GraphQLVariable("lines")], type: .object(CreateAllocationTemplate.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createAllocationTemplate: CreateAllocationTemplate? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "createAllocationTemplate": createAllocationTemplate.flatMap { (value: CreateAllocationTemplate) -> ResultMap in value.resultMap }])
    }

    public var createAllocationTemplate: CreateAllocationTemplate? {
      get {
        return (resultMap["createAllocationTemplate"] as? ResultMap).flatMap { CreateAllocationTemplate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createAllocationTemplate")
      }
    }

    public struct CreateAllocationTemplate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AllocationTemplate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("lines", type: .list(.object(Line.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, lines: [Line?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "AllocationTemplate", "id": id, "name": name, "lines": lines.flatMap { (value: [Line?]) -> [ResultMap?] in value.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } } }])
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

      public var lines: [Line?]? {
        get {
          return (resultMap["lines"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Line?] in value.map { (value: ResultMap?) -> Line? in value.flatMap { (value: ResultMap) -> Line in Line(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Line?]) -> [ResultMap?] in value.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } } }, forKey: "lines")
        }
      }

      public struct Line: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AllocationTemplateLine"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("amount", type: .scalar(String.self)),
            GraphQLField("budget", type: .object(Budget.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, amount: String? = nil, budget: Budget? = nil) {
          self.init(unsafeResultMap: ["__typename": "AllocationTemplateLine", "id": id, "amount": amount, "budget": budget.flatMap { (value: Budget) -> ResultMap in value.resultMap }])
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
  }
}

public final class UpdateAllocationTemplateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateAllocationTemplate($id: ID!, $name: String!, $lines: [AllocationTemplateLineInputObject]) {
      updateAllocationTemplate(id: $id, name: $name, lines: $lines) {
        __typename
        id
        name
        lines {
          __typename
          id
          amount
          budget {
            __typename
            id
          }
        }
      }
    }
    """

  public let operationName: String = "UpdateAllocationTemplate"

  public var id: GraphQLID
  public var name: String
  public var lines: [AllocationTemplateLineInputObject?]?

  public init(id: GraphQLID, name: String, lines: [AllocationTemplateLineInputObject?]? = nil) {
    self.id = id
    self.name = name
    self.lines = lines
  }

  public var variables: GraphQLMap? {
    return ["id": id, "name": name, "lines": lines]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateAllocationTemplate", arguments: ["id": GraphQLVariable("id"), "name": GraphQLVariable("name"), "lines": GraphQLVariable("lines")], type: .object(UpdateAllocationTemplate.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateAllocationTemplate: UpdateAllocationTemplate? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "updateAllocationTemplate": updateAllocationTemplate.flatMap { (value: UpdateAllocationTemplate) -> ResultMap in value.resultMap }])
    }

    public var updateAllocationTemplate: UpdateAllocationTemplate? {
      get {
        return (resultMap["updateAllocationTemplate"] as? ResultMap).flatMap { UpdateAllocationTemplate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateAllocationTemplate")
      }
    }

    public struct UpdateAllocationTemplate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AllocationTemplate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("lines", type: .list(.object(Line.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, lines: [Line?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "AllocationTemplate", "id": id, "name": name, "lines": lines.flatMap { (value: [Line?]) -> [ResultMap?] in value.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } } }])
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

      public var lines: [Line?]? {
        get {
          return (resultMap["lines"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Line?] in value.map { (value: ResultMap?) -> Line? in value.flatMap { (value: ResultMap) -> Line in Line(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Line?]) -> [ResultMap?] in value.map { (value: Line?) -> ResultMap? in value.flatMap { (value: Line) -> ResultMap in value.resultMap } } }, forKey: "lines")
        }
      }

      public struct Line: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AllocationTemplateLine"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("amount", type: .scalar(String.self)),
            GraphQLField("budget", type: .object(Budget.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, amount: String? = nil, budget: Budget? = nil) {
          self.init(unsafeResultMap: ["__typename": "AllocationTemplateLine", "id": id, "amount": amount, "budget": budget.flatMap { (value: Budget) -> ResultMap in value.resultMap }])
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
  }
}

public final class DeleteAllocationTemplateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteAllocationTemplate($id: ID!) {
      deleteAllocationTemplate(id: $id) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "DeleteAllocationTemplate"

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
        GraphQLField("deleteAllocationTemplate", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteAllocationTemplate.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteAllocationTemplate: DeleteAllocationTemplate? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "deleteAllocationTemplate": deleteAllocationTemplate.flatMap { (value: DeleteAllocationTemplate) -> ResultMap in value.resultMap }])
    }

    public var deleteAllocationTemplate: DeleteAllocationTemplate? {
      get {
        return (resultMap["deleteAllocationTemplate"] as? ResultMap).flatMap { DeleteAllocationTemplate(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteAllocationTemplate")
      }
    }

    public struct DeleteAllocationTemplate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AllocationTemplate"]

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
        self.init(unsafeResultMap: ["__typename": "AllocationTemplate", "id": id])
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
