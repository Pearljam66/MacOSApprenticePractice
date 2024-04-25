//
//  ContentView.swift
//  Snowman
//
//  Created by Sarah Clark on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            GameView()
        }
        .frame(minWidth: 1100, minHeight: 500)
    }
}

#Preview {
    ContentView()
}
