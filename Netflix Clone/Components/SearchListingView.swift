import SwiftUI
import SDWebImageSwiftUI

struct SearchListingView: View {
    
    let text: String
    let imageURL: String
    
    var body: some View {
        HStack(spacing: 12) {
            
            
            WebImage(url: URL(string: AppConfig.imageBaseURL + imageURL))
                .resizable()
                .indicator(.activity)
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 75)
                .cornerRadius(8)
                .clipped()
            
            
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Button {
                print("Button tapped")
            } label: {
                Image("Playbuttonlist")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 8)
            }
        }
        .padding(10)
        .background(Color.white.opacity(0.07))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
