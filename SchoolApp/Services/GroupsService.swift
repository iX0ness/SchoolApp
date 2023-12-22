//
//  GroupsService.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

protocol GroupsServiceProtocol {
    func loadGroups(for userId: String) async -> [Group]
}

final class GroupsService: GroupsServiceProtocol {
    func loadGroups(for userId: String) async -> [Group] {
        var groups: [Group] = []
        
        let query = Firestore.firestore().collection("users").whereField("id", isEqualTo: userId)
        
        do {
            let snapshot = try await query.getDocuments().documents.first
            
            guard let data = snapshot?.data(), let references = data["groups"] as? [DocumentReference] else { return [] }
            
            groups = await references.asyncCompactMap { try? await loadGroup($0) }
        } catch {
            DebugTool.print(message: "Failed to fetch groups", error: error)
        }
        
        return groups
    }
    
    private func loadGroup(_ documentReference: DocumentReference) async throws -> Group? {
        return try? await documentReference.getDocument(as: Group.self)
    }
}
