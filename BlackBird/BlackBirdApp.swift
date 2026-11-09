//
//  BlackBirdApp.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI
import WidgetKit

@main
struct BlackBirdApp: App {
    
    init() {

            //Reinicia o tempo a cada abertura do app
            TimelineSimulationTime.reset()

            //Pede pro Widget recalcular seus estados
            WidgetCenter.shared.reloadTimelines(
                ofKind: "BlackBirdWidget"
            )
        }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
    }
}

