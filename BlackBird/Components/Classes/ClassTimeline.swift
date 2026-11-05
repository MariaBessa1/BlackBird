//
//  ClassTimeline.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 05/11/26.
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


import SwiftUI

struct ClassTimeline: View {

    let classes: [ClassSession]

    private let cardHeight: CGFloat = 110
    private let spacing: CGFloat = 50

    private let timeWidth: CGFloat = 55
    private let markerWidth: CGFloat = 20
    private let horizontalSpacing: CGFloat = 10

    var body: some View {

        VStack(spacing: spacing) {

            ForEach(classes) { lesson in

                HStack(spacing: horizontalSpacing) {

                    Text(lesson.time)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .frame(
                            width: timeWidth,
                            alignment: .trailing
                        )

                    Circle()
                        .fill(Color.secondary)
                        .frame(width: 12, height: 12)
                        .frame(width: markerWidth)

                    ClassCard(
                        className: lesson.className,
                        teacherName: lesson.teacherName,
                        roomName: lesson.roomName,
                        cardColor: lesson.classColor
                    )
                    .frame(maxWidth: .infinity)
                    .frame(height: cardHeight)
                    
                }
                .frame(height: cardHeight)
            }
        }
        .background(alignment: .topLeading) {

            GeometryReader { geometry in

                Rectangle()
                    .fill(Color.secondary)
                    .frame(
                        width: 2,
                        height: max(
                            0,
                            geometry.size.height - cardHeight
                        )
                    )
                    .offset(x: timeWidth + horizontalSpacing + markerWidth / 2 - 1, y: cardHeight / 2
                    )
            }
            
        }
        .padding(.horizontal, 10)
    }
}
