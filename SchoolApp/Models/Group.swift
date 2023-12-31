//
//  Group.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 11/08/2023.
//

import Foundation

struct Group: Identifiable, Hashable {
    let id: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}

extension Group: Decodable {
    init(from decoder: Decoder) throws {
        let conatiner = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try Group.decodeDocumentID(from: decoder)
        name = try conatiner.decode(String.self, forKey: .name)
    }
}

extension Group {
    static var mock: Group {
        return Group(id: UUID().uuidString, name: "Angry Nerds")
    }
}
