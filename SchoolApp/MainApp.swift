//
//  MainApp.swift
//  MainApp
//
//  Created by Mykhaylo Levchuk on 04/08/2023.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct MainApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authManager = AuthManager.shared
    var body: some Scene {
        WindowGroup {
            RootScene(loaderModel: RootModel(loaderService: LoaderService()))
                .environmentObject(authManager)
        }
    }
}
