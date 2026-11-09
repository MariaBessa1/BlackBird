//
//  ClassCard.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 05/11/26.
//

import SwiftUI

struct ClassCard: View {
    
    let className: String
    let teacherName: String
    let roomName: String
    let cardColor: Color
    
    var body: some View {
        HStack{
            VStack (alignment: .leading, spacing: 5){
                Text(className)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .minimumScaleFactor(0.7)
                Text(teacherName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                    .minimumScaleFactor(0.5)
            }
            .padding(20)
            
            VStack {
                Spacer()
                Text(roomName)
                    .font(.subheadline)
                    .foregroundStyle(.black)
            }
            .padding(20)
        }
        .background (
            RoundedRectangle (cornerRadius: 30)
                .foregroundStyle(cardColor)
                .frame(minWidth: 260)
        )
    }
}

#Preview {
    ClassCard(className: "Projeto Integrador", teacherName: "Thiago Claro", roomName: "f278", cardColor: .purpleClassCard)
}
