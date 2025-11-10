//
//  HomeScrollRectangleView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 08/11/25.
//

import SwiftUI

struct HomeScrollRectangleView: View {
    let header : String
    var body: some View {
        ZStack {
            ScrollView(.vertical,showsIndicators: false){
                VStack(alignment: .leading,spacing: 25){
                    
                    ForEach(0..<6){ v in 
                        VStack (alignment: .leading,spacing: 20) {
                            Text(header)
                                .font(.subheadline)
                                .bold()
                                .padding(.leading)
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack {
                                    ForEach(0..<6) { ima in
                                        Image("Rectangle14")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 120,height: 120)
                                    }
                                }
                                .padding(.leading)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeScrollRectangleView(header: "")
}
