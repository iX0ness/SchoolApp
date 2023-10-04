//
//  Group.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 11/08/2023.
//

import Foundation

struct Group {
    let id: String = UUID().uuidString
    let name: String
}

extension Group: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
    }
}

extension Group {
    static var mock: Group {
        return Group(name: "Angry Nerds")
    }
}
