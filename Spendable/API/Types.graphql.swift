// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct AllocationTemplateLineInputObject: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - amount
  ///   - budgetId
  ///   - id
  public init(amount: Swift.Optional<String?> = nil, budgetId: Swift.Optional<GraphQLID?> = nil, id: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["amount": amount, "budgetId": budgetId, "id": id]
  }

  public var amount: Swift.Optional<String?> {
    get {
      return graphQLMap["amount"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var budgetId: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["budgetId"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "budgetId")
    }
  }

  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct AllocationInputObject: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - amount
  ///   - budgetId
  ///   - id
  public init(amount: String, budgetId: GraphQLID, id: Swift.Optional<GraphQLID?> = nil) {
    graphQLMap = ["amount": amount, "budgetId": budgetId, "id": id]
  }

  public var amount: String {
    get {
      return graphQLMap["amount"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var budgetId: GraphQLID {
    get {
      return graphQLMap["budgetId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "budgetId")
    }
  }

  public var id: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}
