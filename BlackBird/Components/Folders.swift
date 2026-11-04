//
//  Folders.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct Folders: View {
    var colorFolder: Color
    
    var body: some View {
        ZStack {
            Image(systemName: "calendar")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white)
                .padding(60)
                .padding(.bottom, 30)
                .background (
                    RoundedRectangle(cornerRadius: 70)
                        .foregroundStyle(colorFolder)
                )
            Image(systemName: "calendar")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white.opacity(0.5))
                .padding(50)
                .padding(.bottom, 30)
                .rotationEffect(.degrees(5))
        }
        .overlay (
            ZStack {
                VStack {
                    Spacer()
                    Image("FrontYellowFolder")
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            Rectangle()
                                .fill(.thickMaterial)
                                .mask {
                                    Image("FrontYellowFolder")
                                        .resizable()
                                        .scaledToFit()
                                }
        
                            
                        }
                        .overlay {
                                Image("FrontYellowFolder")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(0.25)
                            }
                }
            }
        )
    }
}

#Preview {
    Folders(colorFolder: .yellowFolder)
}
