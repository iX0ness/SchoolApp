//
//  StudentsView.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 26/12/2023.
//

import SwiftUI

struct StudentsView: View {
    let students: [Student]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                ForEach(students) { student in
                    NavigationLink {
                        GradesScreen(studentId: student.id)
                    } label: {
                        TitleCell(title: student.name)
                            .frame(width: 350, height: 45)
                            .primaryCellStyle()
                    }

                }
            }
        }
    }
}

#Preview {
    StudentsView(students: [])
}
