//
//  ErrorWrapper.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 06/10/2023.
//

import SwiftUI

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let title: String
    let description: String
}
