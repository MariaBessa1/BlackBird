//
//  ClassSession.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 08/11/26.
//

import SwiftUI

struct ClassSession: Identifiable {
    let id = UUID()
    let time: String
    let className: String
    let teacherName: String
    let roomName: String
    let classColor: Color
}

