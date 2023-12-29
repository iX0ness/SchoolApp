//
//  User.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 08/08/2023.
//


import FirebaseFirestore
import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let firstname: String
    let lastname: String
    var profileImageURL: String?
    
    private enum CodingKeys: String, CodingKey {
        case firstname
        case lastname
        case subject
        case profileImageURL
    }
}

extension User: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try User.decodeDocumentID(from: decoder)
        firstname = try container.decode(String.self, forKey: .firstname)
        lastname = try container.decode(String.self, forKey: .lastname)
        profileImageURL = try container.decodeIfPresent(String.self, forKey: .profileImageURL)
    }
}

extension User {
    static var mock: User {
        .init(
            id: "231231231",
            firstname: "John",
            lastname: "Doe"
        )
    }
}






