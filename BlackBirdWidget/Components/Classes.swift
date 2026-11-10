//
//  Classes.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 05/11/26.
//

import SwiftUI
import WidgetKit

import SwiftUI
import WidgetKit

struct Classes: View {

    let hour: String
    let className: String
    let teacherName: String
    let roomName: String
    let colorClass: Color

    @Environment(\.widgetRenderingMode)
    private var renderingMode

    var body: some View {
        GeometryReader { geometry in

            let size = geometry.size.width

            HStack(spacing: 10) {

                Text(hour)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .minimumScaleFactor(0.8)
                    .lineLimit(1)

                Text(roomName)
                    .font(.subheadline)
                    .foregroundStyle(
                        renderingMode == .fullColor
                            ? Color.black
                            : Color.primary
                    )
                    .minimumScaleFactor(0.8)
                    .padding(size * 0.045)
                    .background {
                        Circle()
                            .fill(colorClass)
                            .opacity(
                                renderingMode == .fullColor
                                    ? 1 : 0.25
                            )
                    }

                VStack(alignment: .leading, spacing: 2) {

                    Text(className)
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .minimumScaleFactor(0.8)

                    Text(teacherName)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .minimumScaleFactor(0.8)
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
        }
    }
}


#Preview {
    Classes(hour: "17h01", className: "Projeto Integrador", teacherName: "Thiago Claro", roomName: "f278", colorClass: .blueClassCard)
}
