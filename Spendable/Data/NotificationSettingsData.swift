//
//  NotificationSettingsData.swift
//  Spendable
//
//  Created by Michael St Clair on 2/17/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import SwiftUI
import Combine
import KeychainSwift

extension UserData {
    func loadNotificationSettings() {
        if deviceToken != nil {
            apollo.client.fetch(query: GetNotificationSettingsQuery(deviceToken: deviceToken!)) { result in
                guard let data = try? result.get().data?.notificationSettings else { return }
                self.notificationSettings = NotificationSettings(id: data.id, enabled: data.enabled!)
            }
        }
    }
}
