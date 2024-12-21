//
//  HomeHeader.swift
//  NavigationStackCoordinator
//
//  Created by Ahmed Ibrahim on 19/12/2024.
//

import SwiftUI

struct HomeHeader: View {
    let name: String
    let image: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: image)
                .resizable()
                .background(Color(.pinkFF007E80))
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                P4Label(text: "Hello")
                    .foregroundColor(.gray)
                
                H8Label(text: name)
            }
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.grayF2F2F2))
                Image(.icNotification)
                    .font(.title3)
                    .foregroundColor(.black)
            }
            .frame(width: 40, height: 40)
        }
        .padding()
        .padding(.bottom, 100)
        .background(
            Image(.imgHomeHeaderBackground)
                .resizable()
                .scaledToFill()
                .opacity(0.4)
        )
    }
}
