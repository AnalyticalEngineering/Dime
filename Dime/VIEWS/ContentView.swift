//
//  ContentView.swift
//  Dime
//
//  Created by J. DeWeese on 12/21/23.
//

import SwiftUI

struct ContentView: View {
    
    // Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    //Active Tab
    @State private var activeTab: Tab = .recents
    
    
    var body: some View {
        TabView(selection: $activeTab) {
            
            Text("Recent")
                .tag(Tab.recents)
                .tabItem { Tab.recents.tabContent }
            
            Text("Search")
                .tag(Tab.search)
                .tabItem { Tab.search.tabContent }
            
            Text("Chart")
                .tag(Tab.charts)
                .tabItem { Tab.charts.tabContent }
            
            Text("Settings")
                .tag(Tab.settings)
                .tabItem { Tab.settings.tabContent }
        }
        .tint(appTint)
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    ContentView()
}
