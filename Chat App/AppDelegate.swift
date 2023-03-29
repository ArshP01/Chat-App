//
//  AppDelegate.swift
//  Chat App
//
//  Created by Arsh on 29/03/23.
//

import Foundation
import UIKit
import FirebaseCore

class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
