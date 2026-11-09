//
//  ClassTimeline.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 05/11/26.
//

import SwiftUI

struct ClassTimeline: View {

    let classes: [ClassSession]
    var completedCount: Int = 0

    private let cardHeight: CGFloat = 110
    private let spacing: CGFloat = 50
    private let timeWidth: CGFloat = 55
    private let markerWidth: CGFloat = 20
    private let horizontalSpacing: CGFloat = 10

    var body: some View {

        VStack(spacing: spacing) {

            ForEach(
                Array(classes.enumerated()), id: \.element.id)
            { index, lesson in

                HStack(spacing: horizontalSpacing) {

                    Text(lesson.time)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .frame(
                            width: timeWidth,
                            alignment: .trailing
                        )

                    ZStack {
                        Circle()
                            .fill(index < completedCount
                            ? lesson.classColor
                            : index == completedCount
                                  ? lesson.classColor.opacity(0.5)
                                  : Color.secondary
                            )
                    }
                    .frame(width: 12, height: 12)
                    .frame(width: markerWidth)

                    ClassCard(
                        className: lesson.className,
                        teacherName: lesson.teacherName,
                        roomName: lesson.roomName,
                        cardColor: lesson.classColor
                    )
                    .opacity(index < completedCount ? 0.5 : 1)
                    .frame(maxWidth: .infinity)
                    .frame(height: cardHeight)
                    
                }
                .frame(height: cardHeight)
            }
        }
        .background(alignment: .topLeading) {

            GeometryReader { geometry in

                let lineHeight = max(0, geometry.size.height - cardHeight)
                let progress = classes.count > 1
                    ? Double( min(completedCount, classes.count - 1)) / Double(classes.count - 1)
                    : 0.0

                ZStack(alignment: .top) {

                    Rectangle() //linha principal
                        .fill(Color.secondary.opacity(0.3))
                        .frame(
                            width: 2,
                            height: lineHeight
                        )

                    Rectangle() //linha que atualiza com o progresso
                        .fill(Color.principalYellow)
                        .frame(width: 2, height: lineHeight * progress)
                }
                .offset(x: timeWidth + horizontalSpacing + markerWidth / 2 - 1, y: cardHeight / 2
                )
            }
        }
        .padding(.horizontal, 10)
    }
}
