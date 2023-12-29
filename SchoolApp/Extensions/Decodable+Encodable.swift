//
//  Decodable-Codable+FirebaseIdDecode.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 27/12/2023.
//

import Foundation
import FirebaseFirestore

fileprivate enum CodingKeys: String, CodingKey {
    case id
}

extension Decodable {
    static func decodeDocumentID(from decoder: Decoder) throws -> String {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            let wrapper = try container.decode(DocumentID<String>.self, forKey: .id)
            guard let id = wrapper.wrappedValue else {
                throw DecodingError.valueNotFound(
                    User.self,
                    .init(codingPath: [CodingKeys.id], debugDescription: "Decoding error. Found nil instead of String value")
                )
            }
            return id
        } catch {
            throw error
        }
    }
}
