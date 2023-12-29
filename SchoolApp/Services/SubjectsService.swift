//
//  SubjectsService.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 22/12/2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

protocol SubjectsServiceProtocol {
    func loadSubject(for userId: String) async -> Subject?
}

final class SubjectsService: SubjectsServiceProtocol {
    func loadSubject(for userId: String) async -> Subject? {
        var subject: Subject?
        let reference = Firestore.firestore().collection("users").document(userId)
     
        do {
            let snapshot = try await reference.getDocument()
            guard let data = snapshot.data(), let reference = data["subject"] as? DocumentReference else { return nil }
            
            subject = try await reference.getDocument(as: Subject.self)
        } catch {
            DebugTool.print(message: "Failed to fetch subject", error: error)
        }
        
        return subject
    }
}
