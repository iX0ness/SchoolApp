//
//  StudentsSerivce.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 26/12/2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

protocol StudentsServiceProtocol: AnyObject {
    func loadStudents(for groupId: String) async -> [Student]
    func loadGrades(for studentId: String, and subjectId: String) async -> Grades?
    func addGrade(_ value: Int, for studentId: String, to subjectId: String) async -> Int?
}

final class StudentsSerivce: StudentsServiceProtocol {
    func loadStudents(for groupId: String) async -> [Student] {
        var students: [Student] = []
        let groupReference = FirestoreReference.group(id: groupId)
        
        do {
            let snapshot = try await groupReference.getDocument()
            
            guard let data = snapshot.data(), let references = data["students"] as? [DocumentReference] else { return [] }
            
            students = await references.asyncCompactMap { try? await $0.getDocument(as: Student.self) }
            
        } catch {
            DebugTool.print(message: "Failed to fetch students", error: error)
        }
        
        return students
    }
    
    func loadGrades(for studentId: String, and subjectId: String) async -> Grades? {
        let studentReference = FirestoreReference.student(id: studentId)
        let gradesReference = studentReference.collection(FirestoreCollection.grades.rawValue)
        let subjectReference = FirestoreReference.subject(id: subjectId)
        
        var grades: Grades?
        
        do {
            let gradesSnapshot = try await gradesReference.getDocuments()
                .documents
                .filter { ($0.data()["subject"] as? DocumentReference)?.documentID == subjectReference.documentID }
                .first
            
            grades = try gradesSnapshot?.data(as: Grades.self)
            
        } catch {
            DebugTool.print(message: "Failed to fetch grades for subject \(subjectId) of student \(studentId)", error: error)
        }
        
        return grades
    }
    
    func addGrade(_ value: Int, for studentId: String, to subjectId: String) async -> Int? {
        let studentReference = FirestoreReference.student(id: studentId)
        let gradesReference = studentReference.collection(FirestoreCollection.grades.rawValue)
        let subjectReference = FirestoreReference.subject(id: subjectId)
        
        let newGrade = value
        do {
            let gradesSnapshot = try await gradesReference.getDocuments()
                .documents
                .filter { ($0.data()["subject"] as? DocumentReference)?.documentID == subjectReference.documentID }
                .first
            
            try await gradesSnapshot?.reference.updateData(["grades": FieldValue.arrayUnion([value])])
            return newGrade
            
        } catch {
            DebugTool.print(message: "Failed to fetch grades for subject \(subjectId) of student \(studentId)", error: error)
            return nil
        }
    }
}
