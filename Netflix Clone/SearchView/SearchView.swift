//
//  SearchView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 10/11/25.
//

import SwiftUI
import SwiftUI

struct SearchView: View {
    @State var query: String = ""
    
    var body: some View {
//        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("Top Search")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    
                    ForEach(0..<7) { _ in
                        SearchListingView()
                    }
                }
                .padding(.top)
            }
            .navigationBarHidden(false)
            .background(Color.black.ignoresSafeArea())
            .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always))
//        }
        

    }
}
#Preview {
    NavigationStack {
        SearchView(query: "")
    }
}
