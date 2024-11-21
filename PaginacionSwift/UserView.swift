//
//  UserView.swift
//  PaginacionSwift
//
//  Created by epismac on 17/10/24.
//

import SwiftUI

struct UserView: View {
    var user: User
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.picture.thumbnail)) { image in
                image.resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text("\(user.name.title) \(user.name.first) \(user.name.last)")
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
                Text(user.location.city)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
    }
}
