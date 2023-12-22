//
//  UserService.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 04/08/2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import CollectionConcurrencyKit
import FirebaseStorage

protocol UserServiceProtocol: AnyObject {
    func loadUser(by id: String) async -> User?
    func updateProfileImage(fileName: String, data: Data) async -> String?
    func updateUser(by id: String, with profileImageURL: String) async
}

final class UserService: UserServiceProtocol {
    func loadUser(by id: String) async -> User? {
        let snapshot = Firestore.firestore().collection("users").document(id)
        
        do {
            let user = try await snapshot.getDocument(as: User.self)
            return user
        } catch {
            DebugTool.print(message: "Couldn't parse user", error: error)
        }
        
        return nil
    }
    
    func updateProfileImage(fileName userId: String, data: Data) async -> String? {
        do {
            let imageURL = try await uploadImage(fileName: userId, data: data)
            
            return imageURL
        } catch {
            DebugTool.print(message: "Failed to upload profile image", error: error)
            return nil
        }
    }
    
    func updateUser(by id: String, with profileImageURL: String) async {
        var data = [String: Any]()
        
        data["profileImageURL"] = profileImageURL
        do {
            try await Firestore.firestore().collection("users").document(id).updateData(data)
        } catch {
            DebugTool.print(message: "Failed to update user profile URL", error: error)
        }
    }
}

private extension UserService {
    func uploadImage(fileName: String, data: Data) async throws -> String? {
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await ref.putDataAsync(data)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            DebugTool.print(message: "Failed to upload image", error: error)
            return nil
        }
    }
}

