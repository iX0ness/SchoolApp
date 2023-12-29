//
//  PrimaryCellStyle.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 27/12/2023.
//

import SwiftUI

struct PrimaryCellStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(SCColor.defaultText)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(SCColor.primary, lineWidth: 1)
            )
    }
}

extension View {
    func primaryCellStyle() -> some View {
        modifier(PrimaryCellStyle())
    }
}
