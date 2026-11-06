//
//  CardNotas.swift
//  BlackBird
//
//  Created by Rebeca Emanuela Calmon de Andrade Alves on 04/11/26.
//
import SwiftUI

struct CardNotas: View {
    
    let nomeMateria: String
    let atividades: [AtividadeNota]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(nomeMateria)
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
             
            Divider()
             
            ForEach(atividades) { item in
                HStack {
                    Text(item.nome)
                        .font(.body)
                        .fontWeight(.regular)
                    
                    Spacer()
                    
                    // Formata o Double para texto (ex: exibe 7 ou 7.5)
                    Text(item.nota, format: .number.precision(.fractionLength(0...2)))
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color("cardColor"))
        .cornerRadius(20)
    }
}

#Preview {
    CardNotas(
        nomeMateria: "Antropologia Aplicada a Fatores Sociais no Egito",
        atividades: [
            AtividadeNota(nome: "Prova 1", nota: 7.0),
            AtividadeNota(nome: "ADO 1", nota: 7.0),
            AtividadeNota(nome: "PI II", nota: 6.0)
        ]
    )
    .padding()
}

