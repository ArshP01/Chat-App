//
//  AppDelegate.swift
//  Chat App
//
//  Created by Arsh on 29/03/23.
//

import Foundation
import UIKit
import FirebaseCore
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      print("\(#function)")
        Auth.auth().setAPNSToken(deviceToken, type: AuthAPNSTokenType.unknown)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      print("\(#function)")
      if Auth.auth().canHandleNotification(notification) {
        completionHandler(.noData)
        return
      }
    }
}
