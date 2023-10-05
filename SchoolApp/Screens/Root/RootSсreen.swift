//
//  RootScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 04/08/2023.
//

import SwiftUI

struct RootScreen<T: AuthManagerProtocol>: View {
    @EnvironmentObject var authManager: T
    @State private var isLoading = false
    
    var body: some View {
        if let user = authManager.currentUser {
            GroupScreen(userId: user.uid)
                .onAppear { isLoading = true }
                .overlay {
                    LoadingView(isLoading: $isLoading)
                        .opacity(isLoading ? 1 : 0)
                }
        } else {
            SignInScreen()
                .onAppear { isLoading = true }
                .overlay {
                    LoadingView(isLoading: $isLoading)
                        .opacity(isLoading ? 1 : 0)
                }
        }
    }
}

struct RootScreen_Previews: PreviewProvider {
    static var previews: some View {
        RootScreen<AuthManagerStub>()
            .environmentObject(AuthManagerStub())
    }
}
