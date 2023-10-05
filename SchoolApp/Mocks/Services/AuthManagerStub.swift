//
//  AuthManagerStub.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 08/08/2023.
//

import Foundation


import Foundation
import FirebaseAuth

final class AuthManagerStub: AuthManagerProtocol {
    @Published var currentUser: FirebaseAuth.User?
    
    func createUser(email: String, password: String) async throws {}
    func signIn(email: String, password: String) async throws {}
    func singOut() throws {}
}
