//
//  Grades.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 27/12/2023.
//

import Foundation

struct Grade: Hashable, Identifiable {
    let id = UUID().uuidString
    let value: Int
}

struct Grades: Identifiable, Hashable {
    let id: String
    let grades: [Grade]
    
    private enum CodingKeys: String, CodingKey {
        case grades
    }
}

extension Grades: Decodable {
    init(from decoder: Decoder) throws {
        let conatiner = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try Grades.decodeDocumentID(from: decoder)
        grades = try conatiner.decode([Int].self, forKey: .grades).map { Grade(value: $0) }
    }
}

extension Grade: Equatable {
    static func == (lhs: Grade, rhs: Grade) -> Bool {
        return lhs.id == rhs.id
    }
}
