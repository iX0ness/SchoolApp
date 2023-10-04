//
//  UserService.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 04/08/2023.
//



import FirebaseFirestore
import FirebaseFirestoreSwift
import CollectionConcurrencyKit

protocol UserService: AnyObject {
    func loadUser(by id: String) async throws -> User?
    func loadGroups(_ groupIds: [String]) async -> [Group]
}

final class UserServiceImpl: UserService {
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
    
    func loadGroups(_ groupIds: [String]) async -> [Group] {
        var groups: [Group] = []
        
        groups = await groupIds.asyncCompactMap { try? await loadGroup(by: $0) }
        
        return groups
    }
    
    func loadGroup(by id: String) async throws -> Group? {
        let snapshot = Firestore.firestore().collection("groups").document(id)
        return try? await snapshot.getDocument(as: Group.self)
    }
}
