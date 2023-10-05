//
//  UserServiceStub.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/10/2023.
//

import Foundation

final class UserServiceStub: UserServiceProtocol {
    func loadUser(by id: String) async throws -> User? {
        return .mock
    }
}
