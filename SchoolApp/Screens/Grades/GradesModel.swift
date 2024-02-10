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
    private var gradesWrapper: Grades?
    
    @Published var grades: [Grade] = []
    
    init(studentsService: StudentsServiceProtocol, subjectsService: SubjectsServiceProtocol) {
        self.studentsService = studentsService
        self.subjectsService = subjectsService
    }
    
    @MainActor
    func loadGrades(for studentId: String, and subjectId: String) async {
        gradesWrapper = await studentsService.loadGrades(for: studentId, and: subjectId)
        grades = gradesWrapper?.grades ?? []
    }
    
    @MainActor
    func loadSubject(for userId: String) async -> String {
        return await subjectsService.loadSubject(for: userId)?.id ?? ""
    }
    
    @MainActor
    func addGrade(_ value: Int, for studentId: String, to subjectId: String) async {
        guard let id = gradesWrapper?.id else { return }
        
        if let newGrade = await studentsService.addGrade(value, for: studentId, to: subjectId) {
            grades.append(Grade(value: newGrade))
        }
    }
}
