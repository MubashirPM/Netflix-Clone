//
//  SearchListingView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 08/11/25.
//

import SwiftUI

struct SearchListingView: View {
    
    var body: some View {
            ZStack {
                VStack(alignment: .leading){
                        HStack {
                            Image("ListImage1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 146,height: 76)
                                Spacer()
                            Text("Breaking Bad")
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

#Preview {
    SearchListingView()
}
