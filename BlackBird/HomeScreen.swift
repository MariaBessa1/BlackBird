//
//  HomeScreen.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct HomeScreen: View {
    
let columns: [GridItem] = [
    GridItem(.flexible(), spacing: 12),
    GridItem(.flexible(), spacing: 12),
]
    
var body: some View {
    
    NavigationStack {
        
        ZStack {
            
            Color.background
            .ignoresSafeArea()
            
            VStack {
                
                Text("Olá, Fulano!")
                       .font(.custom("BonaNova-Regular", size: 34, relativeTo: .title2))
                       .foregroundStyle(.primary)
                       .frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: columns, spacing: 12) {
                    Folders(destination: TimelineScreen(), icon: "calendar", iconBack: "calendar", colorFolder: .yellowFolder, frontFolder: "FrontYellowFolder", colorInformations: .yellowDetailsFolder, text: "Cronograma")
                    
                    Folders(destination: ActivitiesScreen(), icon: "list.bullet.clipboard.fill", iconBack: "text.page.fill", colorFolder: .blueFolder, frontFolder: "FrontBlueFolder", colorInformations: .blueDetailsFolder, text: "Atividades")
                    
                    Folders(destination: FrequencyScreen(), icon: "clock.fill", iconBack: "alarm.fill", colorFolder: .greenFolder, frontFolder: "FrontGreenFolder", colorInformations: .greenDetailsFolder, text: "Frequência")
                    
                    Folders(destination: NotesScreen(), icon: "star.fill", iconBack: "trophy.fill", colorFolder: .redFolder, frontFolder: "FrontRedFolder", colorInformations: .redDetailsFolder, text: "Notas")
                }
                
                Spacer()
            }
            .padding(20)
            
        }
    }
    }
}

#Preview {
    HomeScreen()
}
