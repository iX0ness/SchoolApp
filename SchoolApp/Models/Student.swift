//
//  Student.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 26/12/2023.
//

import Foundation

struct Student: Hashable, Identifiable {
    let id: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}

extension Student: Decodable {
    init(from decoder: Decoder) throws {
        let conatiner = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try Group.decodeDocumentID(from: decoder)
        name = try conatiner.decode(String.self, forKey: .name)
    }
}
