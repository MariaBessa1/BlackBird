//
//  BlackBirdClipApp.swift
//  BlackBirdClip
//
//  Created by Rebeca Emanuela Calmon de Andrade Alves on 06/11/26.
//

//import SwiftUI
//
//@main
//struct BlackBirdClipApp: App {
//    @State private var isLoggedIn = false
//    @State private var urlRecebida: URL? = nil
//
//    var body: some Scene {
//        WindowGroup {
//            Group {
//                if isLoggedIn {
//                    // Quando logado, abre a tela de detalhes das notas
//                    NotasDetalhesScreen(
//                        nomeMateria: "Estrutura de Dados",
//                        atividadesMateria: [
//                            AtividadeNota(nome: "ADO 1", nota: 9.0),
//                            AtividadeNota(nome: "Prova 1", nota: 4.0)
//                        ]
//                    )
//                } else {
//                    // Aqui você usa a sua LoginScreen exatamente como ela está
//                    LoginScreen(onLogin: {
//                        // O que acontece quando o usuário clica em "Entrar" na sua tela
//                        withAnimation {
//                            isLoggedIn = true
//                        }
//                    })
//                }
//            }
//            .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
//                if let incomingURL = userActivity.webpageURL {
//                    urlRecebida = incomingURL
//                    print("URL de invocação recebida: \(incomingURL)")
//                }
//            }
//        }
//    }
//}

import SwiftUI

@main
struct BlackBirdClipApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
