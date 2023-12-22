//
//  ProfileHeaderView.swift
//  SchoolApp
//
//  Created by Mykhaylo Levchuk on 20/12/2023.
//

import SwiftUI
import PhotosUI

struct ProfileHeaderView: View {
    @EnvironmentObject var profileModel: ProfileModel
    @State var selectedImage: PhotosPickerItem?
    
    var body: some View {
        PhotosPicker(selection: $selectedImage, matching: .images) {
            
            VStack(spacing: 16) {
                CircularProfileImageView(imageURL: profileModel.user?.profileImageURL)
                
                Text("Edit profile picture")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .tint(SCColor.secondary)
            }
            
        }
        .onChange(of: selectedImage) { image in
            Task {
                let data = await data(from: image)
                await profileModel.updateImage(data: data)
            }
        }
        
    }
    
    private func data(from item: PhotosPickerItem?) async -> Data? {
        guard let item = item,
              let  data = try? await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data),
              let jpegData = uiImage.jpegData(compressionQuality: 0.2) else { return nil }
        
        return jpegData
    }
}

#Preview {
    ProfileHeaderView()
}
