//
//  CardMedia.swift
//  BlackBird
//
//  Created by Rebeca Emanuela Calmon de Andrade Alves on 04/11/26.
//

import SwiftUI

struct CardMedia: View {
    let atividades: [AtividadeNota]
    var maxMedia: Double = 10

    var media: Double {
        guard !atividades.isEmpty else { return 0 }
        let soma = atividades.reduce(0) { $0 + $1.nota }
        return soma / Double(atividades.count)
    }

    private var progresso: Double {
        min(max(media / maxMedia, 0), 1)
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                GaugeArc()
                    .stroke(
                        Color.white,
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    )

                GaugeArc(progress: progresso)
                    .stroke(
                        Color(red: 0.12, green: 0.12, blue: 0.12),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    )

                VStack(spacing: 0) {
                    Text("\(media.formatted(.number.precision(.fractionLength(0...1))))")
                        .font(.custom("DMSans-Bold", size: 64, relativeTo: .largeTitle))

                    Text("Sua média")
                        .font(.custom("DMSans-Bold", size: 24, relativeTo: .title3))
                }
                .foregroundStyle(Color(red: 0.12, green: 0.12, blue: 0.12))
                .offset(y: 20)
            }
            .frame(height: 160)
        }
        .padding(20)
        .background(Color(red: 1.0, green: 0.82, blue: 0.42))
        .clipShape(RoundedRectangle(cornerRadius: 28))
    }
}

struct GaugeArc: Shape {
    var progress: Double = 1

    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width / 2, rect.height)
        let center = CGPoint(x: rect.midX, y: rect.maxY)

        var path = Path()
        let startAngle: Double = 180
        let endAngle: Double = 180 + (180 * progress)

        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(startAngle),
            endAngle: .degrees(endAngle),
            clockwise: false
        )

        return path
    }
}

#Preview {
    CardMedia(atividades: [
        AtividadeNota(nome: "Atividade 1", nota: 8.0),
        AtividadeNota(nome: "Atividade 2", nota: 7.0),
        AtividadeNota(nome: "Atividade 3", nota: 9.0)
    ])
    .padding()
    .background(Color(red: 1.0, green: 0.97, blue: 0.91))
}
