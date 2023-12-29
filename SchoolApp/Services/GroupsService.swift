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
        
        let userReference = Firestore.firestore().collection("users").document(userId)
        let query = Firestore.firestore().collection("groups").whereField("teacher", isEqualTo: userReference)
        
        do {
            let snapshots = try await query.getDocuments().documents
            groups = snapshots.compactMap { try? $0.data(as: Group.self) }

        } catch {
            DebugTool.print(message: "Failed to fetch groups", error: error)
        }
        
        return groups
    }
    
    private func loadGroup(_ documentReference: DocumentReference) async throws -> Group? {
        return try? await documentReference.getDocument(as: Group.self)
    }
}
