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
                    Label("Home", systemImage: "house.fill")
                }

            SearchView(query: "")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            TrendingListView()
                .tabItem {
                    Label("Trending", systemImage: "checkmark.circle.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
            
        }
        .tint(.red)
    }
}

#Preview {
    TabBarView()
}
