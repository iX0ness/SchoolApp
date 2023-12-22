//
//  ProfileDataView.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 20/12/2023.
//

import SwiftUI

struct ProfileDataView: View {
    var user: User?
    
    var body: some View {
        VStack(spacing: 25) {
            Divider()
                .overlay { SCColor.primary }
            
            ProfileHeaderView()
            
            Divider()
                .overlay { SCColor.primary }
            
            ProfileInfoSectionView(
                firstname: user?.firstname ?? "",
                lastname: user?.lastname ?? "",
                subject: user?.subject ?? ""
            )
            .padding(.horizontal, 16)
            
            Spacer()
        }
    }
    
}

#Preview {
    ProfileDataView(user: User.mock)
}


