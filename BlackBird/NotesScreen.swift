//
//  NotesScreen.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct NotesScreen: View {
    let materiasExemplo = [
        MateriaNota(
            nome: "Antropologia Aplicada a Fatores Sociais no Egito",
            atividades: [
                AtividadeNota(nome: "Prova 1", nota: 7.0),
                AtividadeNota(nome: "ADO 1", nota: 8.5),
                AtividadeNota(nome: "PI II", nota: 9.0)
            ]
        ),
        MateriaNota(
            nome: "História da Educação",
            atividades: [
                AtividadeNota(nome: "Trabalho 1", nota: 9.0),
                AtividadeNota(nome: "Prova Final", nota: 8.0)
            ]
        )
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 24) {
                        ForEach(materiasExemplo) { item in
                            NavigationLink {
                                NotasDetalhesScreen(
                                    nomeMateria: item.nome,
                                    atividadesMateria: item.atividades
                                )
                            } label: {
                                // Agora utilizando o CardNotas corretamente!
                                CardNotas(
                                    nomeMateria: item.nome,
                                    atividades: item.atividades
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(26)
                }
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
}

struct MateriaNota: Identifiable {
    let id = UUID()
    let nome: String
    let atividades: [AtividadeNota]
}

// MARK: - Preview da NotesScreen
#Preview {
    NotesScreen()
}
