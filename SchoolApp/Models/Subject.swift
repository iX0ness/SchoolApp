//
//  Subject.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 22/12/2023.
//

import Foundation

struct Subject: Identifiable, Hashable {
    let id: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}



extension Subject: Decodable {
    init(from decoder: Decoder) throws {
        let conatiner = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try Subject.decodeDocumentID(from: decoder)
        name = try conatiner.decode(String.self, forKey: .name)
    }
}
