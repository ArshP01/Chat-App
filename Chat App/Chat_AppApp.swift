//
//  Chat_AppApp.swift
//  Chat App
//
//  Created by Arsh on 29/03/23.
//

import SwiftUI


@main
struct Chat_AppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(ContactsViewModel())
        }
    }
}
