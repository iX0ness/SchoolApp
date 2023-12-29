//
//  Collections.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 09/08/2023.
//

import Foundation

enum Collections {}

// MARK: - Students collection
extension Collections {
    enum Students: String {
        static let name: String = "strudents"
        
        //MARK: Subcollections
        case grades
    }
}
