//
//  RandomUserRow.swift
//  CombineWithAlamofire
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import SwiftUI

struct RandomUserRow: View {
    
    var randomUser: RandomUser
    
    init(_ randomUser: RandomUser) {
        self.randomUser = randomUser
    }
    
    var body: some View {
        HStack {
            let url = randomUser.profileImgUrl
            ProfileImageView(imageUrl: url)
            Text("\(randomUser.name.description)")
                .fontWeight(.heavy)
                .font(.system(size: 25))
                .lineLimit(2)
                .minimumScaleFactor(0.5)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: 50,
            alignment: .leading
        )
        .padding(.vertical)
    }
}

struct RandomUserRow_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserRow(RandomUser.getDummy())
    }
}
