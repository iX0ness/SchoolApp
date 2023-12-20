//
//  ProfileScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import SwiftUI

struct ProfileScreen<T: AuthManagerProtocol>: View {
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ProfileDataView()
                    .padding(.top, 16)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ProfileMenuView<AuthManager>()
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        ProfileScreen<AuthManagerStub>()
            .navigationTitle("Profile")
    }
    
}
