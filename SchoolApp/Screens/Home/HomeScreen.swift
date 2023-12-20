//
//  HomeScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import SwiftUI

struct HomeScreen: View {
    let userId: String
    
    var body: some View {
        TabView {
            GroupsScreen(userId: userId)
                .tabItem {
                    Label("Groups", image: "groups_tab")
                }
            ProfileScreen<AuthManager>()
                .tabItem {
                    Label("Profile", image: "profile_tab")
                }
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = SCColor.UI.tabBar
            
        }
        .tint(SCColor.main)
    }
}

#Preview {
    HomeScreen(userId: "mGQtQonDiRRlJtzHk5AdGiX3w6p1")
}
