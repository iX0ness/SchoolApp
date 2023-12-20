//
//  User.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 08/08/2023.
//

import Firebase
import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let firstname: String
    let lastname: String
    let subject: String
    let groups: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstname
        case lastname
        case subject
        case groups
    }
}

extension User: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        firstname = try container.decode(String.self, forKey: .firstname)
        lastname = try container.decode(String.self, forKey: .lastname)
        subject = try  container.decode(String.self, forKey: .subject)
        groups = try container.decode([String].self, forKey: .groups)
    }
}

extension User {
    static var mock: User {
        .init(
            id: "231231231",
            firstname: "John",
            lastname: "Doe",
            subject: "Math",
            groups: []
        )
    }
}
