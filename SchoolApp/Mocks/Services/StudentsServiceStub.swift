//
//  StudentsServiceStub.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 29/12/2023.
//

import Foundation

class StudentsServiceStub: StudentsServiceProtocol {
    func loadStudents(for groupId: String) async -> [Student] {
        [Student(id: "1", name: "Harry Potter")]
    }
    
    func loadGrades(for studentId: String, and subjectId: String) async -> Grades? {
        nil
    }
}
