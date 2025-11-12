//
//  HomeScrollView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 08/11/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeScrollView: View {
    let imageURL: String
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                    
                WebImage(url: URL(string: AppConfig.imageBaseURL + imageURL))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                        
            }
            .padding(.top)
        }
        

    }
    
}
#Preview {
    HomeScrollView(imageURL: "")
}
