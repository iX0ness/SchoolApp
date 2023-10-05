//
//  GroupService.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

protocol GroupServiceProtocol {
    func loadGroups(_ groupIds: [String]) async -> [Group]
}

final class GroupService: GroupServiceProtocol {
    func loadGroups(_ groupIds: [String]) async -> [Group] {
        var groups: [Group] = []
        
        groups = await groupIds.asyncCompactMap { try? await loadGroup(by: $0) }
        
        return groups
    }
    
    private func loadGroup(by id: String) async throws -> Group? {
        let snapshot = Firestore.firestore().collection("groups").document(id)
        return try? await snapshot.getDocument(as: Group.self)
    }
}
