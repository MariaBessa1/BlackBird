//
//  CardMedia.swift
//  BlackBird
//
//  Created by Rebeca Emanuela Calmon de Andrade Alves on 05/11/26.
//

import SwiftUI

struct NotasDetalhesScreen: View {

    // Recebe o nome da matéria selecionada
    let nomeMateria: String

    // Recebe as atividades da matéria selecionada
    let atividadesMateria: [AtividadeNota]

    var body: some View {

        ZStack {
            Color.background
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20){

                    
                    Text(nomeMateria)
                        .font(.custom("DMSans-Bold", size: 24, relativeTo: .title))
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 4)

                    // Card com a tabela de notas
                    CardDetalhesNotas(
                        atividades: atividadesMateria
                    )

                    // Card com a média
                    CardMedia(atividades: atividadesMateria)
                }
                .padding(24)
            }
        }
    }
}

#Preview {
    NavigationStack {
        NotasDetalhesScreen(
            nomeMateria: "Antropologia Aplicada",
            atividadesMateria: [
                AtividadeNota(nome: "Prova 1", nota: 7.0),
                AtividadeNota(nome: "ADO 1", nota: 8.5),
                AtividadeNota(nome: "PI II", nota: 9.0)
            ]
        )
    }
}



