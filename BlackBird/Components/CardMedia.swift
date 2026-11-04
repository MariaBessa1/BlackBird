//
//  CardMedia.swift
//  BlackBird
//
//  Created by Rebeca Emanuela Calmon de Andrade Alves on 04/11/26.
//


import SwiftUI

struct CardMedia: View {

    // Média atual do estudante.
    var media: Double = 8

    // Nota máxima possível.
    var maxMedia: Double = 10

    // Calcula quanto do arco deve ser preenchido (entre 0 e 1).
    private var progresso: Double {
        min(max(media / maxMedia, 0), 1)
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                // Desenha o arco completo de fundo (parte não preenchida).
                GaugeArc()
                    .stroke(
                        Color.white,
                        style: StrokeStyle(
                            lineWidth: 20,
                            lineCap: .round
                        )
                    )

                // Desenha o arco escuro proporcional à média.
                GaugeArc(progress: progresso)
                    .stroke(
                        Color(red: 0.12, green: 0.12, blue: 0.12),
                        style: StrokeStyle(
                            lineWidth: 20,
                            lineCap: .round
                        )
                    )

                // Agrupa o número da média e sua descrição com suporte a Dynamic Type.
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


// MARK: - Desenho do arco

struct GaugeArc: Shape {
    var progress: Double = 1

    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width / 2, rect.height)
        let center = CGPoint(
            x: rect.midX,
            y: rect.maxY
        )

        var path = Path()

        // Correção do cálculo do ângulo final baseada no progresso
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


// MARK: - Preview

#Preview {
    CardMedia(media: 2)
        .padding()
        .background(Color(red: 1.0, green: 0.97, blue: 0.91))
}

