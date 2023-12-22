//
//  UserServiceStub.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import Foundation

final class UserServiceStub: UserServiceProtocol {
    func loadUser(by id: String) async -> User? {
        return .mock
    }
    
    func updateProfileImage(fileName: String, data: Data) async -> String? {
        return nil
    }
    
    func updateUser(by id: String, with profileImageURL: String) async {}
}
