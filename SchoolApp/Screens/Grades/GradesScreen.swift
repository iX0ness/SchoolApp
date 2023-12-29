//
//  GradesScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 27/12/2023.
//

import SwiftUI

struct GradesScreen: View {
    @EnvironmentObject var userModel: UserModel
    @StateObject private var gradesModel = GradesModel(
        studentsService: Dependencies.studentsService,
        subjectsService: Dependencies.subjectsService
    )
    
    let studentId: String
    
    var body: some View {
        List(gradesModel.grades, id: \.self) {
            Text("\($0)")
        }
        .task {
            if let subject = userModel.subject {
                await gradesModel.loadGrades(for: studentId, and: subject.id)
            }
        }
    }
}

#Preview {
    GradesScreen(studentId: "7itOgiUJW67SgmNUZo9p")
}

extension GradesScreen {
    struct Dependencies {
        static var studentsService: StudentsServiceProtocol = StudentsSerivce()
        static var subjectsService: SubjectsServiceProtocol = SubjectsService()
    }
}
