//
//  GroupCellView.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 16/08/2023.
//

import SwiftUI

struct GroupCellView: View {
    let group: Group
    
    var body: some View {
        Text(group.name)
            .frame(width: 150, height: 60)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(SCColor.main, lineWidth: 1)
            )
    }
}

struct GroupCellView_Previews: PreviewProvider {
    static var previews: some View {
        GroupCellView(group: .mock)
    }
}
