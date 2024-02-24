//
//  FirestoreReference.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 10/02/2024.
//

import Foundation
import FirebaseFirestore

enum FirestoreCollection: String {
    case users
    case groups
    case students
    case grades
    case subjects
}

struct FirestoreReference {
    static func user(id: String) -> DocumentReference {
        return Firestore.firestore().collection(FirestoreCollection.users.rawValue).document(id)
    }
    
    static func groups() -> CollectionReference {
        return Firestore.firestore().collection(FirestoreCollection.groups.rawValue)
    }
    
    static func group(id: String) -> DocumentReference {
        return Firestore.firestore().collection(FirestoreCollection.groups.rawValue).document(id)
    }
    
    static func student(id: String) -> DocumentReference {
        return Firestore.firestore().collection(FirestoreCollection.students.rawValue).document(id)
    }
    
    static func subject(id: String) -> DocumentReference {
        return Firestore.firestore().collection(FirestoreCollection.subjects.rawValue).document(id)
    }
}


