//
//  ProfileScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import SwiftUI

struct ProfileScreen<T: AuthManagerProtocol>: View {
    @EnvironmentObject var authManager: T
    
    var body: some View {
        Button("Sign out") {
            do {
                try authManager.singOut()
            } catch {
                
            }
        }
    }
}

#Preview {
    ProfileScreen<AuthManagerStub>()
        .environmentObject(AuthManagerStub())
}
