//
//  SCTextField.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 05/08/2023.
//

import SwiftUI

struct SCTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.subheadline)
        .padding(22)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .tint(SCColor.primary)
    }
}
