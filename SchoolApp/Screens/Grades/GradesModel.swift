//
//  GradesModel.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 27/12/2023.
//

import Foundation

final class GradesModel: ObservableObject {
    private let studentsService: StudentsServiceProtocol
    private let subjectsService: SubjectsServiceProtocol
    @Published var grades: [Int] = []
    
    init(studentsService: StudentsServiceProtocol, subjectsService: SubjectsServiceProtocol) {
        self.studentsService = studentsService
        self.subjectsService = subjectsService
    }
    
    @MainActor
    func loadGrades(for studentId: String, and subjectId: String) async {
        grades = await studentsService.loadGrades(for: studentId, and: subjectId)?.grades ?? []
    }
    
    @MainActor
    func loadSubject(for userId: String) async -> String {
        return await subjectsService.loadSubject(for: userId)?.id ?? ""
    }
}
