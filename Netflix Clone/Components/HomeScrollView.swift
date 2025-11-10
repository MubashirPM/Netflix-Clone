//
//  HomeScrollView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 08/11/25.
//

import SwiftUI

struct HomeScrollView: View {
    let header : String
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(header)
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(0..<6) { _ in
                            Image("ListImage")
                                .resizable()
                                .aspectRatio(contentMode:.fill)
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }

    }
    
}
#Preview {
    HomeScrollView(header: "")
}
