//
//  LoginSide.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 10/11/25.
//


//
//  LoginSide.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 10/11/25.
//

import SwiftUI

struct LoginSide: View {
    @State private var showAlert = false
    var body: some View {
        VStack (spacing: 20){
            Image(systemName: "rectangle.portrait.and.arrow.right")
                .font(.largeTitle)
                .foregroundColor(.green)
            Text("Are You Sure Want to Log Out")
                .font(.title2)
                .bold()
                
            Text("You will need to login again to acess your account.")
                .foregroundColor(.gray)
            
            HStack {
                Button {
                    showAlert = true
                } label: {
                    Text("YES")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(
                            Color(red: 0/255, green: 128/255, blue: 85/255)
                        )
                        .frame(
                            width: 130,
                            height: 45
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    Color(
                                        red: 0/255,
                                        green: 128/255,
                                        blue: 85/255
                                    ),
                                    lineWidth: 2
                                )
                        )
                }
                Button {
                    showAlert = false
                } label: {
                    Text("NO")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 130, height: 45)
                        .background(
                            Color(red: 0/255, green: 128/255, blue: 85/255)
                        )
                        .cornerRadius(10)
                }


            }
            
        }
    }
}

#Preview {
    LoginSide()
}
