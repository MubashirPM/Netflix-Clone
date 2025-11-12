//
//  Shimmer.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 13/11/25.
//


import SwiftUI

// MARK: - Shimmer Modifier
struct Shimmer: ViewModifier {
    @State private var phase: CGFloat = 0
    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [.white.opacity(0.25), .white.opacity(0.6), .white.opacity(0.25)]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
                    .rotationEffect(.degrees(30))
                    .offset(x: -300 + phase, y: 0)
                    .blendMode(.plusLighter)
            )
            .mask(content)
            .onAppear {
                withAnimation(.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                    phase = 800
                }
            }
    }
}
extension View {
    func shimmer(_ active: Bool = true) -> some View {
        Group {
            if active { self.modifier(Shimmer()) } else { self }
        }
    }
}

// MARK: - Skeleton Views
struct RectSkeleton: View {
    var cornerRadius: CGFloat = 6
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Color(.systemGray5))
            .shimmer()
    }
}

struct PosterSkeleton: View {
    var body: some View {
        RectSkeleton(cornerRadius: 8)
            .frame(width: 120, height: 180)
    }
}

struct RowSkeleton: View {
    var body: some View {
        HStack(spacing: 12) {
            PosterSkeleton()
            VStack(alignment: .leading, spacing: 8) {
                RectSkeleton().frame(height: 18).frame(maxWidth: 180)
                RectSkeleton().frame(height: 14).frame(maxWidth: 140)
                RectSkeleton().frame(height: 12).frame(maxWidth: 90)
            }
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}