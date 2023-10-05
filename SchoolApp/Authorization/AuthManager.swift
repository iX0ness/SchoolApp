//
//  AuthManager.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 08/08/2023.
//

import Foundation
import FirebaseAuth

protocol AuthManagerProtocol: ObservableObject {
    var currentUser: FirebaseAuth.User? { get }
    
    func createUser(email: String, password: String) async throws
    func signIn(email: String, password: String) async throws
    func singOut() throws
}


final class AuthManager: AuthManagerProtocol {
    @Published var currentUser: FirebaseAuth.User?
    
    static let shared = AuthManager()
    
    init() {
        loadUser()
    }
    

    func loadUser()  {
        if let user = Auth.auth().currentUser {
            currentUser = user
        } else {
            currentUser = nil
        }
    }
}



extension AuthManager {
    @MainActor
    func createUser(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            currentUser = result.user
        } catch {
            DebugTool.print(message: "Failed to create user", error: error)
        }
    }
    
    @MainActor
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            currentUser = result.user
        } catch {
            DebugTool.print(message: "Failed to sign in", error: error)
        }
    }
    
    @MainActor
    func singOut() throws {
        do {
            try Auth.auth().signOut()
            currentUser = nil
        } catch {
            DebugTool.print(message: "Failed to sign out", error: error)
        }
    }
}

