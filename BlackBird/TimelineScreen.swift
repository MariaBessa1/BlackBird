//
//  TimelineScreen.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct TimelineScreen: View {
    var body: some View {
        ZStack {
            Color.background
            .ignoresSafeArea()
        }
        .navigationTitle("Cronograma")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    TimelineScreen()
}
