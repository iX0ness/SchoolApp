//
//  StudentsModel.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 22/12/2023.
//

import Foundation

final class StudentsModel: ObservableObject {
    private let studentsService: StudentsServiceProtocol
    @Published var students: [Student] = []
    
    init(studentsService: StudentsServiceProtocol) {
        self.studentsService = studentsService
    }
    
    @MainActor
    func loadStudents(for groupId: String) async {
        students = await studentsService.loadStudents(for: groupId)
    }
}
