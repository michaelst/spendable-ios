//
//  AppDelegate.swift
//  Spendable
//
//  Created by Michael St Clair on 10/13/19.
//  Copyright © 2019 Fifty Seven Media. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var userData = UserData()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let notificationOption = launchOptions?[.remoteNotification]

        if (notificationOption as? [String: AnyObject]) != nil {
            userData.apollo.client.clearCache()
        }
        
        application.registerForRemoteNotifications()
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceTokenData: Data) {
        let tokenParts = deviceTokenData.map { data in String(format: "%02.2hhx", data) }
        userData.loadNotificationSettings(deviceToken: tokenParts.joined())
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        userData.notificationSettings.enabled = false
    }
    
    func application(
      _ application: UIApplication,
      didReceiveRemoteNotification notification: [AnyHashable: Any],
      fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
        userData.apollo.client.clearCache()
    }
    
    
}

