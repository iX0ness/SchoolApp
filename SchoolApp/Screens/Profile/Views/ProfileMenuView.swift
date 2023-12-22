//
//  ProfileMenuView.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 20/12/2023.
//

import SwiftUI

struct ProfileMenuView<T: AuthManagerProtocol>: View {
    @EnvironmentObject var authManager: T
    
    var body: some View {
        Menu(
            content: {
                Button(
                    action: { signOut() },
                    label: {
                        Text("Sign out")
                            .foregroundStyle(SCColor.defaultText)
                    }
                )
            },
            label: {
                Image("menu_icon")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
        )
    }
    
    private func signOut() {
        do {
            try authManager.singOut()
        } catch {
            DebugTool.print(message: "Failed to sign out", error: error)
        }
    }
}

#Preview {
    ProfileMenuView<AuthManagerStub>()
        .environmentObject(AuthManagerStub())
}
