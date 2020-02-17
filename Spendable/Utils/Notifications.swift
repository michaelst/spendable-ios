//
//  Notifications.swift
//  Spendable
//
//  Created by Michael St Clair on 2/17/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit
import KeychainSwift

struct Notifcations {
    
    static func registerForPushNotifications() {
        let keychain = KeychainSwift()
        
        if keychain.get("device-token") == nil {
            UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    guard granted else { return }
                    
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
            }
        }
    }
    
}
