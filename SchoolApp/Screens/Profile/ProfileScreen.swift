//
//  ProfileScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import SwiftUI

struct ProfileScreen: View {
    @StateObject var profileModel = ProfileModel(userService: Dependencies.userService)
    
    let userId: String
    
    var body: some View {
        NavigationStack {
            VStack {
                ProfileDataView(user: profileModel.user)
                    .environmentObject(profileModel)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ProfileMenuView<AuthManager>()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await profileModel.loadUser(id: userId)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileScreen(userId: "mGQtQonDiRRlJtzHk5AdGiX3w6p1")
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Profile")
    }
    
}

extension ProfileScreen {
    struct Dependencies {
        static let userService: UserServiceProtocol = UserService()
    }
}
