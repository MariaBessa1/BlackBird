//
//  CardDetalhesNotas.swift
//  BlackBird
//
//  Created by Rebeca Emanuela Calmon de Andrade Alves on 04/11/26.
//

import SwiftUI

struct CardDetalhesNotas: View {
    
    let nomeMateria: String
    let atividades: [AtividadeNota]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            HStack {
                Text("Item")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Text("Nota")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Divider()

            ForEach(atividades) { item in
                HStack {
                    Text(item.nome)
                        .font(.custom("DMSans-SemiBold", size: 17, relativeTo: .body))
                            .underline()
                            .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text(item.nota)
                        .font(.custom("DMSans-SemiBold", size: 17, relativeTo: .body))
                            .underline()
                            .foregroundColor(.primary)
                }
                .padding(.vertical, 4)
            }
        }
        .padding(20)
        .background(Color("cardColor"))
        .cornerRadius(20)
        .padding()
        .navigationTitle(nomeMateria)
    }
}

#Preview {
    NavigationStack {
        CardDetalhesNotas(
            nomeMateria: "Antropologia",
            atividades: [
                AtividadeNota(nome: "Atividade 1", nota: "8 / 10"),
                AtividadeNota(nome: "Atividade 2", nota: "7 / 10"),
                AtividadeNota(nome: "Atividade 3", nota: "10 / 10")
            ]
        )
    }
}
