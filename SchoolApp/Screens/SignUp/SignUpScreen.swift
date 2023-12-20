//
//  SignUpScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 04/08/2023.
//

import SwiftUI

struct SignUpScreen: View {
    @State var email = ""
    @State var password = ""
    @State var firstname = ""
    @State var repeatPassword = ""
    @State var lastname = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .modifier(SCTextField())
            
            SecureField("Password", text: $password)
                .modifier(SCTextField())
            
            SecureField("Repeat password", text: $repeatPassword)
                .modifier(SCTextField())
            
            TextField("First name", text: $email)
                .modifier(SCTextField())
            
            TextField("Last name", text: $email)
                .modifier(SCTextField())
            
            Button(
                action: { print("Sign up") },
                label: {
                    Text("Complete registration")
                        .frame(width: 250, height: 55)
                        .background(SCColor.main)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            )
            .padding(.top, 20)
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Create user")
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUpScreen()
        }
    }
}
