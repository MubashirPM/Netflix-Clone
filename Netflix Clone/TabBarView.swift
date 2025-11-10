//
//  TabBarView.swift
//  Netflix Clone
//
//  Created by MUNAVAR PM on 10/11/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "list.dash")
                }

            SearchView(query: "")
                .tabItem {
                    Label("Search", systemImage: "square.and.pencil")
                }
            TrendingListView()
                .tabItem {
                    Label("Trending", systemImage: "list.dash")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "list.dash")
                }
            
        }
    }
}

#Preview {
    TabBarView()
}
