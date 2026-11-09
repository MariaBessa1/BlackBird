//
//  ContentView.swift
//  BlackBirdClip
//
//  Created by Rebeca Emanuela Calmon de Andrade Alves on 06/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var urlRecebida: URL? = nil

    var body: some View {
        Group {
            if isLoggedIn {
                // Quando logado, abre a tela de detalhes das notas
                NotasDetalhesScreen(
                    nomeMateria: "Estrutura de Dados",
                    atividadesMateria: [
                        AtividadeNota(nome: "ADO 1", nota: 9.0),
                        AtividadeNota(nome: "Prova 1", nota: 4.0)
                    ]
                )
            } else {
                // Exibe a LoginScreen compartilhada
                LoginScreen(onLogin: {
                    withAnimation {
                        isLoggedIn = true
                    }
                })
            }
        }
        // Intercepta a URL enviada pelo QR Code ou Link do App Clip
        .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
            if let incomingURL = userActivity.webpageURL {
                urlRecebida = incomingURL
                print("URL de invocação recebida no App Clip: \(incomingURL)")
            }
        }
    }
}

#Preview {
    ContentView()
}
