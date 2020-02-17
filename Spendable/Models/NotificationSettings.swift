//
//  NotificationSettings.swift
//  Spendable
//
//  Created by Michael St Clair on 2/17/20.
//  Copyright © 2020 Fifty Seven Media. All rights reserved.
//

import Foundation
import Combine

class NotificationSettings: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    let apollo = Apollo()
    
    let id: String?
    
    var enabled: Bool {
        willSet { self.objectWillChange.send() }
        didSet {
            self.save()
            
            if enabled {
                Notifcations.registerForPushNotifications()
            }
        }
    }
    
    init(id: String? = nil, enabled: Bool = false) {
        self.id = id
        self.enabled = enabled
    }
    
    func save() {
        if id != nil {
            apollo.client.perform(mutation: UpdateNotificationSettingsMutation(id: id!, enabled: enabled))
        }
    }
}
