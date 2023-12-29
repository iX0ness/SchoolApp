//
//  TitleCell.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 27/12/2023.
//

import SwiftUI

struct TitleCell: View {
    let title: String
    
    var body: some View {
        Text(title)
    }
}

#Preview {
    TitleCell(title: "title")
}
