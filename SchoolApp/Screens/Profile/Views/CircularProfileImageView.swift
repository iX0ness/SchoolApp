//
//  CircularProfileImageView.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 20/12/2023.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    let imageURL: String?
    
    var body: some View {
        if let url = imageURL {
            KFImage(URL(string: url))
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
        } else {
            Image("profile_placeholder")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .foregroundColor(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileImageView(imageURL: nil)
}
