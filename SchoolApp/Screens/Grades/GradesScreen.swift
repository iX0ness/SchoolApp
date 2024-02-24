//
//  GradesScreen.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 27/12/2023.
//

import SwiftUI

struct GradesScreen: View {
    @EnvironmentObject var userModel: UserModel
    @State private var showAddGradeAlert = false
    @State private var showAddGradeConfirmation = false
    @State private var newGrade = ""
    @StateObject private var gradesModel = GradesModel(
        studentsService: Dependencies.studentsService,
        subjectsService: Dependencies.subjectsService
    )
    let studentId: String
    
    var body: some View {
        List(gradesModel.grades) {
            Text("\($0.value)")
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(
                    action: { showAddGradeAlert.toggle() },
                    label: { Image("add_icon") }
                )
            }
        }
        .alert("Add new grade for student", isPresented: $showAddGradeAlert) {
            TextField("", text: $newGrade)
                .keyboardType(.decimalPad)
            
            Button(
                action: { showAddGradeConfirmation.toggle() },
                label: { Text("Add") }
            )
            
            Button(
                action: { dismissAlert() },
                label: { Text("Cancel") }
            )
        }
        .confirmationDialog(
            "Are you sure?",
            isPresented: $showAddGradeConfirmation,
            titleVisibility: .visible,
            actions: {
                Button(
                    role: .destructive,
                    action: { addGrade() },
                    label: { Text("Save") }
                )
                
                Button(
                    role: .cancel,
                    action: {},
                    label: { Text("Cancel") }
                )
            },
            message: {
                Text("The grade will be added to a remote server.\nIn case of removal or edit you'll have to report it in a dean's office.")
            }
        )
        .task {
            if let subject = userModel.subject {
                await gradesModel.loadGrades(for: studentId, and: subject.id)
            }
        }
        .navigationTitle("Grades")
    }
    
    private func addGrade() {
        guard let grade = Int(newGrade),
              let subjectId = userModel.subject?.id else { return }
        Task {
            await gradesModel.addGrade(grade, for: studentId, to: subjectId)
        }
        newGrade = ""
    }
    
    private func dismissAlert() {
        showAddGradeAlert = false
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
