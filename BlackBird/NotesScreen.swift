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
            nome: "Antropologia em Sistemas",
            atividades: [
                AtividadeNota(nome: "Prova 1", nota: 7.0),
                AtividadeNota(nome: "ADO 1", nota: 8.5),
                AtividadeNota(nome: "PI II", nota: 9.0)
            ]
        ),
        MateriaNota(
            nome: "História da Educação",
            atividades: [
                AtividadeNota(nome: "Artigo 1", nota: 9.0),
                AtividadeNota(nome: "Prova Final", nota: 8.0)
            ]
        )
    ]

    var body: some View {
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
            ToolbarItem(placement: .confirmationAction)
                {
                Button {
                } label: {
                    Image(systemName:
                            "line.3.horizontal.decrease")
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
