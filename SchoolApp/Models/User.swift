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
    var profileImageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstname
        case lastname
        case subject
        case profileImageURL
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
        profileImageURL = try container.decodeIfPresent(String.self, forKey: .profileImageURL)
//        groups = try container.decode([DocumentReference].self, forKey: .groups).map { $0.path }
    }
}

extension User {
    static var mock: User {
        .init(
            id: "231231231",
            firstname: "John",
            lastname: "Doe",
            subject: "Math"
        )
    }
}

extension User {
    func printData() {
        print(
            """
            🟢 User model
            ▶️ \(firstname)
            ▶️ \(lastname)
            ▶️ \(profileImageURL)
            """
        )
    }
}
