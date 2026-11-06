//
//  ContentView.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usuarioLogado = false
    
    var body: some View {
        
        if usuarioLogado {
            MainTabView()
        } else {
            LoginScreen(onLogin: {
                usuarioLogado = true
            }
            )
        }
    }
}

#Preview {
    ContentView()
}


