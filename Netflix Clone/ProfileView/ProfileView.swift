//
//  ProfileView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 10/11/25.
//

import SwiftUI

struct ProfileView: View {
    @State var showLogin = false
    var body: some View {
        ZStack {
            
            ScrollView(.vertical,showsIndicators: false) {
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading,spacing: 10) {
                        HStack {
                            Image("ProfileImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 24,height: 25)
                                
                            
                            Text("Tell Friends About Netflix.")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white)
                        }
                        Text(
                            "Watch and share your favorite shows and movies together.Enjoy endless entertainment anytime,anywhere.invite your friend to join Netflix and start streaming today"
                        )
                        .foregroundStyle(.white)
                        .lineSpacing(4)
                        .padding(.bottom)
                        
                        Text("Terms and Conditions")
                            .underline()
                            .foregroundStyle(.white)
                        
                        HStack {
                            Image("CopyLinkBT")
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "checkmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 26,height: 20)
                                .foregroundStyle(.white)
                            
                            Text("My List")
                                .foregroundStyle(.white)
                                .font(.headline)
                                .padding(.top)
                        }
                        Divider()
                            .background(Color.white)
                        Text ("App Settings")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        Text ("Acount")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        Text ("Help")
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        Button("Sign Out"){
                            showLogin = true
                        }
                        .foregroundStyle(.white)
                        .navigationDestination(isPresented: $showLogin){
                            LoginSide()
                        }
                        
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(Color.black)
//            .ignoresSafeArea()
        }
    }
}

#Preview {
    ProfileView()
}

