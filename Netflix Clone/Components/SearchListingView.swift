//
//  SearchListingView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 08/11/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchListingView: View {
    
    let text : String
    let imageURL : String
    var body: some View {
            ZStack {
                VStack(alignment: .leading){
                        HStack {
                            WebImage(
                                url: URL(string: AppConfig.imageBaseURL + imageURL)
                            )
                            .resizable()
                            .indicator(.activity)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 146,height: 76)
                                Spacer()
                            Text(text)
                                .font(.headline)
                            
                            Spacer()
                            
                            Button {
                                print("Button tapped")
                            } label: {
                                Image("Playbuttonlist")
                                    .padding(.horizontal)
                            }
                        }
                        .background(Color.gray)
                }
            }
    }
}

