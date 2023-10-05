//
//  UserService.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 04/08/2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import CollectionConcurrencyKit

protocol UserServiceProtocol: AnyObject {
    func loadUser(by id: String) async throws -> User?
}

final class UserService: UserServiceProtocol {
    func loadUser(by id: String) async throws -> User? {
        let snapshot = Firestore.firestore().collection("users").document(id)
        
        do {
            let user = try await snapshot.getDocument(as: User.self)
            return user
        } catch {
            DebugTool.print(message: "Couldn't parse", error: error)
        }
        
        return nil
    }
}
