//
//  Grades.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 27/12/2023.
//

import Foundation

struct Grades: Identifiable, Hashable {
    let id: String
    let grades: [Int]
    
    private enum CodingKeys: String, CodingKey {
        case grades
    }
}

extension Grades: Decodable {
    init(from decoder: Decoder) throws {
        let conatiner = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try Grades.decodeDocumentID(from: decoder)
        grades = try conatiner.decode([Int].self, forKey: .grades)
    }
}
