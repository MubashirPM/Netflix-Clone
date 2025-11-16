//
//  AutoScrollImageView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 16/11/25.
//


import SwiftUI
import Combine

struct AutoScrollImageView: View {
    let images: [String]
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(images.indices, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 424, height: 415)
                    .clipped()
                    .tag(index)
            }
        }
        .tabViewStyle(.page)
        .frame(width: 424, height: 415)  // exact size you wanted
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % images.count
            }
        }
    }
}
