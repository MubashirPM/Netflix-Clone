//
//  HomeActionButtons.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 08/11/25.
//

import SwiftUI

struct HomeActionButtons: View {
  
    
    var body: some View {
        ZStack {
            HStack {
                VStack{
                    Image("PlusButton")
                        .resizable()
                        .frame(width: 24,height: 24)
                    Text("my list")
                        .foregroundStyle(.white)
                        .font(.caption)
                    
                }
                Spacer()
                HStack {
                    Image("playButton")
                        .resizable()
                        .frame(width: 24,height: 24)
                    Button("Play"){
                        
                    }
                    .tint(.black)
                }
                .padding()
                .background(Color.white)
                Spacer()
                
                VStack{
                    Image("InfoBT")
                        .resizable()
                        .frame(width: 24,height: 24)
                    Text("Info")
                        .foregroundColor(.white)
                    
                }
                
                .padding()
                            
                .cornerRadius(10)
            }
            
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)

    }
}

#Preview {
    HomeActionButtons()
}
