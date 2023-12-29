//
//  StudentsScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 22/12/2023.
//

import SwiftUI

struct StudentsScreen: View {
    @ObservedObject private var studentsModel = StudentsModel(studentsService: Dependencies.studentsService)
    let group: Group
    
    var body: some View {
        StudentsView(students: studentsModel.students)
            .task {
                await studentsModel.loadStudents(for: group.id)
            }
            .navigationTitle(group.name)
    }
}

#Preview {
    StudentsScreen(group: .mock)
}

extension StudentsScreen {
    struct Dependencies {
        static var studentsService: StudentsServiceProtocol = StudentsSerivce()
    }
}
