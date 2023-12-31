//
//  SignInScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 04/08/2023.
//

import SwiftUI

struct SignInScreen<T: AuthManagerProtocol>: View {
    @EnvironmentObject var authManager: T
    @State private var errorWrapper: ErrorWrapper?
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                TextField("Email", text: $email)
                    .modifier(SCTextField())
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $password)
                    .modifier(SCTextField())
                
                Button(
                    action: {
                        Task { await signIn() }
                    },
                    label: {
                        Text("Sign In")
                            .frame(width: 250, height: 55)
                            .background(SCColor.primary)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                )
                .padding(.top, 10)
                
                Spacer()
                
                HStack(spacing: 0) {
                    Text("First time here? ")
                    NavigationLink(
                        destination: SignUpScreen(),
                        label: { 
                            Text("Sign up  ")
                                .tint(SCColor.primary)
                        }
                    )
                    Text("and create account")
                }
                .font(.subheadline)
                
            }
            .padding(.horizontal)
            .alert(item: $errorWrapper) { errorWrapper in
                Alert(title: Text(errorWrapper.title), message: Text(errorWrapper.description))
            }
        }
    }
}

private extension SignInScreen {
    func signIn() async {
        do {
            try await authManager.signIn(email: email, password: password)
        } catch {
            errorWrapper = ErrorWrapper(
                error: error,
                title: "Sign in failure",
                description: error.localizedDescription
            )
        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen<AuthManagerStub>()
            .environmentObject(AuthManagerStub())
    }
}
