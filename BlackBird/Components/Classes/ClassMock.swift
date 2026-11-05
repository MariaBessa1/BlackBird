//
//  ClassMock.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 05/11/26.
//
import Foundation

enum ClassMock {

    static let classes: [ClassSession] = [
        ClassSession(
            time: "19:10",
            className: "Projeto Integrador",
            teacherName: "Thiago Claro",
            roomName: "F278",
            classColor: .yellowClassCard
        ),

        ClassSession(
            time: "19:50",
            className: "Comunicação, liderança e negociação",
            teacherName: "Carlos Levita",
            roomName: "F278",
            classColor: .redClassCard
        ),

        ClassSession(
            time: "20:50",
            className: "Fundamentos de Engenharia Econômica",
            teacherName: "Bruno Escobar",
            roomName: "F278",
            classColor: .blueClassCard
        ),
        
        ClassSession(
            time: "21:05",
            className: "Algorítmos",
            teacherName: "Guilherme Rey",
            roomName: "F278",
            classColor: .purpleClassCard
            )
        
    ]
}
