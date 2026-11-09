//
//  ContentView.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usuarioLogado = false
    @State private var timelineWidget = false
    
    
    var body: some View {
        
        Group {
            if usuarioLogado {
                MainTabView()
            } else {
                LoginScreen(onLogin: {
                    usuarioLogado = true
                }
                )
            }
        }
        .onOpenURL { url in

           if url.scheme == "blackbird",
              url.host == "cronograma" {

               timelineWidget = true
           }
       }
    }
}

#Preview {
    ContentView()
}


