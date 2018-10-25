//
//  AppDelegate.swift
//  PizzaPush
//
//  Created by Christopher Batin on 24/10/2018.
//  Copyright © 2018 Christopher Batin. All rights reserved.
//

import UIKit
import PushNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    let pushNotifications = PushNotifications.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.pushNotifications.start(instanceId: "6b87bf51-26e3-4117-a312-281c64817f0b")
        self.pushNotifications.registerForRemoteNotifications()
        try? self.pushNotifications.subscribe(interest: "pizza")

        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        self.pushNotifications.registerDeviceToken(deviceToken)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        self.pushNotifications.handleNotification(userInfo: userInfo)
    }

}

