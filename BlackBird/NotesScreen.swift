//
//  NotesScreen.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct NotesScreen: View {
    var body: some View {
        ZStack {
            Color.background
            .ignoresSafeArea()
        }
        .navigationTitle("Notas")
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                       } label: {
                           Image(systemName: "line.3.horizontal.decrease")
                       }
                       .buttonStyle(.glassProminent)
                       .tint(Color.accent)
            }
        }
        .tint(Color.accent)
    }
}

#Preview {
    NotesScreen()
}
