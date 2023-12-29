//
//  SubjectsServiceStub.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 29/12/2023.
//

import Foundation

struct SubjectsServiceStub: SubjectsServiceProtocol {
    func loadSubject(for userId: String) async -> Subject? {
        Subject(id: "1", name: "Programming")
    }
    
    
}
