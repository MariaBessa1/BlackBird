//
//  MateriaNota.swift
//  BlackBird
//
//  Created by Rebeca Emanuela Calmon de Andrade Alves on 05/11/26.
//


import Foundation

struct MateriaNota: Identifiable {
    let id = UUID()
    let nome: String
    let atividades: [AtividadeNota]
}