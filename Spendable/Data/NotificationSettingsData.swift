//
//  NotificationSettingsData.swift
//  Spendable
//
//  Created by Michael St Clair on 2/17/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation

extension UserData {
    func loadNotificationSettings(deviceToken: String) {
        apollo.client.fetch(query: GetNotificationSettingsQuery(deviceToken: deviceToken)) { result in
            guard let data = try? result.get().data?.notificationSettings else { return }
            self.notificationSettings = NotificationSettings(id: data.id, enabled: data.enabled!)
        }
    }
}
