//
//  ProfileScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import SwiftUI

struct ProfileScreen: View {
    @EnvironmentObject var userModel: UserModel
    
    var body: some View {
        NavigationStack {
            VStack {
                ProfileDataView(user: userModel.user, subject: userModel.subject)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ProfileMenuView<AuthManager>()
                }
            }
            .task {
                await userModel.loadSubject()
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        ProfileScreen()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Profile")
    }
    
}

extension ProfileScreen {
    struct Dependencies {
        static var userService: UserServiceProtocol = UserService()
        static var subjectsService: SubjectsServiceProtocol = SubjectsService()
    }
}
