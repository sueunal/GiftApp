//
//  ContentView.swift
//  What'sGift
//
//  Created by sueun kim on 2023/06/27.
//

import SwiftUI

struct MainTabView: View {
    @State var SelectView : Int = 0
    var body: some View {
        NavigationStack(root:{
            ZStack{
                VStack{
                    TabView(selection: $SelectView ) {
                        GiftListView().tabItem {
                            Label("Gift", systemImage: "gift")
                        }.toolbarBackground(.visible, for: .bottomBar)
                        SearchView().tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }.tag(2)
                        LoginView().tabItem{
                            Label("Login", systemImage: "person.circle")
                        }.tag(3)
                    }
                }
            }
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color.white.opacity(0.2))
            
            // Use this appearance when scrolling behind the TabView:
            UITabBar.appearance().standardAppearance = appearance
            // Use this appearance when scrolled all the way up:
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
