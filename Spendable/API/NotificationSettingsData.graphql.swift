// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetNotificationSettingsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetNotificationSettings($deviceToken: String!) {
      notificationSettings(deviceToken: $deviceToken) {
        __typename
        id
        enabled
      }
    }
    """

  public let operationName: String = "GetNotificationSettings"

  public var deviceToken: String

  public init(deviceToken: String) {
    self.deviceToken = deviceToken
  }

  public var variables: GraphQLMap? {
    return ["deviceToken": deviceToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootQueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("notificationSettings", arguments: ["deviceToken": GraphQLVariable("deviceToken")], type: .object(NotificationSetting.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(notificationSettings: NotificationSetting? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "notificationSettings": notificationSettings.flatMap { (value: NotificationSetting) -> ResultMap in value.resultMap }])
    }

    public var notificationSettings: NotificationSetting? {
      get {
        return (resultMap["notificationSettings"] as? ResultMap).flatMap { NotificationSetting(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "notificationSettings")
      }
    }

    public struct NotificationSetting: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["NotificationSettings"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("enabled", type: .scalar(Bool.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, enabled: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "NotificationSettings", "id": id, "enabled": enabled])
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

      public var enabled: Bool? {
        get {
          return resultMap["enabled"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "enabled")
        }
      }
    }
  }
}

public final class UpdateNotificationSettingsMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateNotificationSettings($id: ID!, $enabled: Boolean!) {
      updateNotificationSettings(id: $id, enabled: $enabled) {
        __typename
        id
        enabled
      }
    }
    """

  public let operationName: String = "UpdateNotificationSettings"

  public var id: GraphQLID
  public var enabled: Bool

  public init(id: GraphQLID, enabled: Bool) {
    self.id = id
    self.enabled = enabled
  }

  public var variables: GraphQLMap? {
    return ["id": id, "enabled": enabled]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateNotificationSettings", arguments: ["id": GraphQLVariable("id"), "enabled": GraphQLVariable("enabled")], type: .object(UpdateNotificationSetting.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateNotificationSettings: UpdateNotificationSetting? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "updateNotificationSettings": updateNotificationSettings.flatMap { (value: UpdateNotificationSetting) -> ResultMap in value.resultMap }])
    }

    public var updateNotificationSettings: UpdateNotificationSetting? {
      get {
        return (resultMap["updateNotificationSettings"] as? ResultMap).flatMap { UpdateNotificationSetting(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateNotificationSettings")
      }
    }

    public struct UpdateNotificationSetting: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["NotificationSettings"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("enabled", type: .scalar(Bool.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, enabled: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "NotificationSettings", "id": id, "enabled": enabled])
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

      public var enabled: Bool? {
        get {
          return resultMap["enabled"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "enabled")
        }
      }
    }
  }
}
