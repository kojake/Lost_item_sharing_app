//
//  Lost_item_sharingApp.swift
//  Lost_item_sharing
//
//  Created by kaito on 2023/05/28.
//

import SwiftUI
import FirebaseCore

var post_name = [String]()
var post_title = [String]()
var post_tag = [String]()
var post_content = [String]()

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main
struct Lost_item_sharingApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
