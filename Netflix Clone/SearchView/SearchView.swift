//
//  SearchView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 10/11/25.
//

import SwiftUI

struct SearchView: View {
    @State var query : String
    var body: some View {
        ZStack {
            ScrollView(.vertical,showsIndicators: false){
                VStack {
                    Text("Top Search")
                        .bold()
                    ForEach(0..<4){ _ in
                        SearchListingView()
                    }
                }
            }
            .searchable(text: $query,prompt: "Search Movie...")
        }
    }
}

