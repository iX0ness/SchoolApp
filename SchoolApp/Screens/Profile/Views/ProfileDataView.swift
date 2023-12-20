//
//  ProfileDataView.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 20/12/2023.
//

import SwiftUI

struct ProfileDataView: View {
    
    var body: some View {
        VStack(spacing: 16) {
            Image("profile_placeholder")
                .resizable()
                .frame(width: 75, height: 75)
            
            HStack {
                VStack(spacing: 8) {
                    VStack {
                        Text("First name")
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                        
                        Text("John")
                            .font(.headline)
                            .foregroundStyle(Color.black)
                    }
                    
                    
                    VStack {
                        Text("Last name")
                            .font(.caption)
                            .foregroundStyle(Color.gray)
                        
                        Text("Doe")
                            .font(.headline)
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
