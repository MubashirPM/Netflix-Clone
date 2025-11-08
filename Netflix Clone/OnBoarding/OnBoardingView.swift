//
//  OnBoardingView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 08/11/25.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        ZStack {
            Image("onBoardImage")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
        }
    }
}

#Preview {
    OnBoardingView()
}
