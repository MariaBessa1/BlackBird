//
//  TimelineScreen.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct TimelineScreen: View {
    
    @State private var selectedDate = Date()
    
    var body: some View {
        ZStack {
            Color.background
            .ignoresSafeArea()
            
            VStack (alignment: .leading, spacing: 35){
                SelectorDates(selectedDate: $selectedDate)
                
                DaysCarousel(selectedDate: $selectedDate)

                ScrollView(.vertical, showsIndicators: false) {
                    ClassTimeline(
                        classes: ClassMock.classes
                    )
                }
              
                
            }
        }
        .navigationTitle("Cronograma de aulas")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    TimelineScreen()
}
