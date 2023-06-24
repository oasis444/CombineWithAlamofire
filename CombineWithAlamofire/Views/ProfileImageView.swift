//
//  ProfileImageView.swift
//  CombineWithAlamofire
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import SwiftUI
import URLImage

struct ProfileImageView: View {
    
    var imageUrl: URL
    
    var body: some View {
        URLImage(imageUrl) { image, info in
            image.resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 50, height: 60)
        .clipShape(Circle())
        .overlay(Circle().stroke(
            Color.init(.systemOrange),
            lineWidth: 2
        ))
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://randomuser.me/api/portraits/women/72.jpg")!
        ProfileImageView(imageUrl: url)
    }
}
