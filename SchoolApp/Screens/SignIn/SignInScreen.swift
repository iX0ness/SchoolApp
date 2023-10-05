//
//  SignInScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 04/08/2023.
//

import SwiftUI

struct SignInScreen: View {
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject var viewModel = SignInViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Email", text: $viewModel.email)
                .modifier(SCTextField())
                .textInputAutocapitalization(.never)
                
            SecureField("Password", text: $viewModel.password)
                .modifier(SCTextField())
            
            Button(
                action: {
                    Task {
                        try await authManager.signIn(email: viewModel.email, password: viewModel.password)
                    }
                },
                label: {
                    Text("Sign In")
                        .frame(width: 250, height: 55)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            )
            .padding(.top, 10)
            
            Spacer()
            
            HStack(spacing: 0) {
                Text("First time here? ")
                Text("Sign Up ")
                    .fontWeight(.bold)
                Text("and create account")
            }
            .font(.subheadline)
            
        }
        .padding(.horizontal)
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
