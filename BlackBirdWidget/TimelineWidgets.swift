//
//  TimelineWidgets.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 06/11/26.
//

import SwiftUI
import WidgetKit

struct TimelineWidgets: View {
  
    let timeline: TimelineState
    
    @Environment(\.widgetRenderingMode)
    private var renderingMode
    
    
var body: some View {
        
    GeometryReader { geometry in
        let size = geometry.size.width

        
        VStack (spacing: 5) {
            
            Text("Próxima Aula:")
                .font(.caption2)
                .foregroundStyle(.secondary)
            
            if let lesson = timeline.nextClass {
                
                Text(lesson.className)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.8)
                
                Text(lesson.teacherName)
                    .font(.caption)
                    .fontWeight(.medium)
                    .minimumScaleFactor(0.8)
                    .foregroundStyle(.secondary)
                
                ZStack {
                    Circle()
                        .fill(lesson.classColor)
                        .opacity(renderingMode == .fullColor ? 1 : 0.25)
                    
                    Text(lesson.roomName)
                        .font(.subheadline)
                        .foregroundStyle(
                            renderingMode == .fullColor
                            ? Color.black
                            : Color.primary
                        )
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }
                .frame(
                    width: size * 0.30,
                    height: size * 0.30
                )
                .padding(.top, 15)
                
                HStack {
                    
                    Spacer()
                    
                    Image(.feather)
                }
            }
        }
        .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .center
            )
        }
    }
}

struct TimelineMedium: View {
    let timeline: TimelineState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

           HStack {
               Text("Cronograma")
                   .fontWeight(.bold)
                   .font(.caption)

               Spacer()

               Image(.feather)
           }

           Spacer(minLength: 4)

            ForEach(
                Array(
                    timeline.classes
                        .dropFirst(timeline.completedCount)
                        .prefix(2)
                )
            ) { lesson in //pega só as duas primeiras matérias e vai tirando a primeira
               Classes(
                   hour: lesson.time,
                   className: lesson.className,
                   teacherName: lesson.teacherName,
                   roomName: lesson.roomName,
                   colorClass: lesson.classColor
               )
           }
       }
      
    }
}

struct TimelineLarge: View {

    let timeline: TimelineState

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {

            HStack {

                Text("Cronograma")
                    .fontWeight(.bold)
                    .font(.footnote)


                Spacer()

                Image(.feather)
            }
            
            Spacer()

            GeometryReader { geometry in

                let rowHeight = geometry.size.height / CGFloat(max(timeline.classes.count, 1))

                let lineHeight = max(0, geometry.size.height - rowHeight)

                let progress = timeline.classes.count > 1
                    ? Double(
                        min(timeline.completedCount, timeline.classes.count - 1
                        )
                    ) / Double(timeline.classes.count - 1): 0.0

                ZStack(alignment: .topLeading) {

                    ZStack(alignment: .top) {

                        Rectangle()
                            .fill(Color.secondary.opacity(0.5))
                            .frame(width: 2, height: lineHeight)

                        Rectangle()
                            .fill(Color.principalYellow)
                            .frame(width: 2, height: lineHeight * progress
                            )
                    }
                    .offset(x: 5, y: rowHeight / 2)

                    VStack(spacing: 0) {

                        ForEach(
                            Array(timeline.classes.enumerated()),
                            id: \.element.id
                        ) { index, lesson in

                            HStack(spacing: 8) {

                                Circle()
                                    .fill(index < timeline.completedCount
                                            ? lesson.classColor
                                            : index == timeline.completedCount
                                                ? lesson.classColor.opacity(0.5)
                                                : Color.secondary
                                    )
                                    .frame(width: 12, height: 12)

                                Classes(
                                    hour: lesson.time,
                                    className: lesson.className,
                                    teacherName: lesson.teacherName,
                                    roomName: lesson.roomName,
                                    colorClass: lesson.classColor
                                )
                                .opacity(index < timeline.completedCount ? 0.5 : 1)
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct TimelineLargeLarge: View {
    let timeline: TimelineState
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {

            HStack {

                Text("Cronograma")
                    .fontWeight(.bold)
                    .font(.footnote)

                Spacer()

                Image(.feather)
            }

            Spacer()
            
            GeometryReader { geometry in

                let rowHeight = geometry.size.height / CGFloat(max(timeline.classes.count, 1))

                let lineHeight = max(0, geometry.size.height - rowHeight)

                let progress = timeline.classes.count > 1
                    ? Double(
                        min(timeline.completedCount, timeline.classes.count - 1
                        )
                    ) / Double(timeline.classes.count - 1): 0.0

                ZStack(alignment: .topLeading) {

                    ZStack(alignment: .top) {

                        Rectangle()
                            .fill(Color.secondary.opacity(0.5))
                            .frame(width: 2, height: lineHeight)

                        Rectangle()
                            .fill(Color.principalYellow)
                            .frame(width: 2, height: lineHeight * progress
                            )
                    }
                    .offset(x: 5, y: rowHeight / 2)

                    VStack(spacing: 0) {

                        ForEach(
                            Array(timeline.classes.enumerated()),
                            id: \.element.id
                        ) { index, lesson in

                            HStack(spacing: 8) {

                                Circle()
                                    .fill(index < timeline.completedCount
                                            ? lesson.classColor
                                            : index == timeline.completedCount
                                                ? lesson.classColor.opacity(0.5)
                                                : Color.secondary
                                    )
                                    .frame(width: 12, height: 12)

                                Classes(
                                    hour: lesson.time,
                                    className: lesson.className,
                                    teacherName: lesson.teacherName,
                                    roomName: lesson.roomName,
                                    colorClass: lesson.classColor
                                )
                                .opacity(index < timeline.completedCount ? 0.5 : 1)
                                .frame(maxWidth: .infinity)
                            }
                        
                        }
                    }
                }
            }
        }
    }
}

