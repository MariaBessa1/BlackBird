//
//  ContentView.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab {
                HomeScreen()
            } label: {
                Label("Início", image: "BirdHouseIcon")
            }
            
            Tab("Perfil", systemImage: "person.crop.circle.fill") {
                UserProfileScreen()
            }
        }
        .tint(Color.principalYellow)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ContentView()
}
