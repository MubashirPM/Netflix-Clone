import SwiftUI
import Combine
import SDWebImageSwiftUI

struct AutoScrollImageView: View {
    let movies: [AutoScrollMovie]
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        if movies.isEmpty {
            Color.black
                .frame(height: 430)
        } else {
            TabView(selection: $currentIndex) {
                ForEach(movies.indices, id: \.self) { index in
                    NavigationLink(destination: MovieDetailView(movieId: movies[index].id)) {
                        ZStack(alignment: .bottomLeading) {

                            WebImage(url: URL(string: AppConfig.imageBaseURL + movies[index].image))
                                .resizable()
                                .indicator(.activity)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 424, height: 430)
                                .clipped()

                            Text(movies[index].title)
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                                .padding(.bottom, 12)
                                .padding(.leading, 20)
                                .shadow(radius: 10)
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page)
            .frame(width: 424, height: 430)
            .onReceive(timer) { _ in
                withAnimation {
                    currentIndex = (currentIndex + 1) % movies.count   
                }
            }
        }
    }
}
