//
//  TimelineWidgets.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 06/11/26.
//

import SwiftUI
import WidgetKit

struct TimelineWidgets: View {
    
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
        
        VStack (spacing: 5) {
            
            Text("Próxima Aula:")
                .font(.caption2)
                .foregroundStyle(.secondary)
            Text(className)
                .font(.headline)
                .fontWeight(.semibold)
                .minimumScaleFactor(0.8)
            
            Text(teacherName)
                .font(.caption)
                .fontWeight(.medium)
                .minimumScaleFactor(0.8)
                .foregroundStyle(.secondary)
            
            ZStack {
                Circle()
                    .fill(colorClass)
                    .opacity(renderingMode == .fullColor ? 1 : 0.25)

                Text(roomName)
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
        .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .center
            )
    }
    }
}

struct TimelineMedium: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("Cronograma")
                    .fontWeight(.bold)
                    .font(.caption)
                
                Spacer()
                
                Image(.feather)
            }
            
            Spacer(minLength: 20)
            
            Classes(hour: "17h01", className: "Projeto Integrador", teacherName: "Thiago Claro", roomName: "f278", colorClass: .blueClassCard)
            
            Classes(hour: "17h01", className: "Projeto Integrador", teacherName: "Thiago Claro", roomName: "f278", colorClass: .blueClassCard)
            
        }
      
    }
}

struct TimelineLarge: View {
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Cronograma")
                    .fontWeight(.bold)
                    .font(.caption)
                
                Spacer()
                
                Image(.feather)
            }
            
            Spacer(minLength: 20)
            
            
            Classes(hour: "17h01", className: "Projeto Integrador", teacherName: "Thiago Claro", roomName: "f278", colorClass: .blueClassCard)
            
            Classes(hour: "17h01", className: "Projeto Integrador", teacherName: "Thiago Claro", roomName: "f278", colorClass: .blueClassCard)
            
            Classes(hour: "17h01", className: "Projeto Integrador", teacherName: "Thiago Claro", roomName: "f278", colorClass: .blueClassCard)
            
            Classes(hour: "17h01", className: "Projeto Integrador", teacherName: "Thiago Claro", roomName: "f278", colorClass: .blueClassCard)
            
        }
      
    }
}


#Preview {
    TimelineWidgets(hour: "17h01", className: "Projeto Integrador", teacherName: "Thiago Claro", roomName: "f278", colorClass: .blueClassCard)
}


#Preview {
    TimelineMedium()
}

#Preview {
    TimelineLarge()
}
