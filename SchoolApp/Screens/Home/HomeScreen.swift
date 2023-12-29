//
//  HomeScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var userModel = UserModel(
        userService: Dependencies.userService,
        subjectsService: Dependencies.subjectsService
    )
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        TabView {
            if let _ = userModel.user {
                GroupsScreen()
                    .tabItem {
                        Label("Groups", image: "groups_tab")
                    }
                ProfileScreen()
                    .tabItem {
                        Label("Profile", image: "profile_tab")
                    }
            }
        }
        .task { await userModel.loadUser(id: userId) }
        .environmentObject(userModel)
        .onAppear(perform: setTabBarColor)
        .tint(SCColor.primary)
    }
    
    private func setTabBarColor() {
        UITabBar.appearance().backgroundColor = SCColor.UI.tabBar
    }
}

#Preview {
    HomeScreen(userId: "mGQtQonDiRRlJtzHk5AdGiX3w6p1")
}

extension HomeScreen {
    struct Dependencies {
        static var userService: UserServiceProtocol = UserService()
        static var subjectsService: SubjectsService = SubjectsService()
    }
}
