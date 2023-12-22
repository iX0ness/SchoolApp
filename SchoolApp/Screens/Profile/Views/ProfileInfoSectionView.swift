//
//  ProfileInfoSectionView.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 20/12/2023.
//

import SwiftUI

struct ProfileInfoSectionView: View {
    let firstname: String
    let lastname: String
    let subject: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading) {
                    Text("First name")
                        .font(.subheadline)
                        .foregroundStyle(SCColor.main)
                    
                    Text(firstname)
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundStyle(SCColor.secondary)
                }
                
                VStack(alignment: .leading) {
                    Text("Last name")
                        .font(.subheadline)
                        .foregroundStyle(SCColor.main)
                    
                    Text(lastname)
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundStyle(SCColor.secondary)
                }
                
                VStack(alignment: .leading) {
                    Text("Subject")
                        .font(.subheadline)
                        .foregroundStyle(SCColor.main)
                    
                    Text(subject)
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundStyle(SCColor.secondary)
                }
            }
            
            Spacer()
                
        }
    }
}

#Preview {
    ProfileInfoSectionView(
        firstname: "John",
        lastname: "Doe",
        subject: "Math"
    )
}
