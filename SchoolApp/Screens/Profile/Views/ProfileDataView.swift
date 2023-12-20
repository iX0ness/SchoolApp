//
//  ProfileDataView.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 20/12/2023.
//

import SwiftUI

struct ProfileDataView: View {
    
    var body: some View {
        VStack(spacing: 50) {
            Image("profile_placeholder")
                .resizable()
                .frame(width: 75, height: 75)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading) {
                        Text("First name")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray)
                        
                        Text("John")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundStyle(Color.black)
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("Last name")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray)
                        
                        Text("Doe")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundStyle(Color.black)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Subject")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray)
                        
                        Text("Math")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundStyle(Color.black)
                    }
                }
                .padding(.horizontal, 10)
                Spacer()
                    
            }
            
            
            
            
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ProfileDataView()
}
