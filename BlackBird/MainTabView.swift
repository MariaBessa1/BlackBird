//
//  MainTabView.swift
//  BlackBird
//
//  Created by Rebeca Emanuela Calmon de Andrade Alves on 05/11/26.
//
import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView {

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
    }
}

#Preview{
    MainTabView()
}
