//
//  Folders.swift
//  BlackBird
//
//  Created by Maria Clara Fernandes Bessa on 04/11/26.
//

import SwiftUI

struct Folders<Destination: View>: View {
    var destination: Destination
    var icon: String
    var iconBack: String
    var colorFolder: Color
    var frontFolder: String
    var colorInformations: Color
    var text: String
    
    var body: some View {
        NavigationLink(destination: destination) {
            GeometryReader { geometry in
                let size = geometry.size.width
                
                ZStack {
                    RoundedRectangle(cornerRadius: size * 0.22)
                        .fill(colorFolder)
                        .frame(width: size, height: size)
                    
                    Image(systemName: iconBack)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .padding(size * 0.16)
                        .padding(.bottom, size * 0.1)
                    
                    Image(systemName: iconBack)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white.opacity(0.25))
                        .padding(size * 0.13)
                        .padding(.bottom, size * 0.1)
                        .rotationEffect(.degrees(5))
                }
                .frame(width: size, height: size)
                .overlay (
                    ZStack {
                        VStack {
                            Spacer()
                            Image(frontFolder)
                                .resizable()
                                .scaledToFit()
                                .frame(width: size)
                                .overlay {
                                    Rectangle()
                                        .fill(.thickMaterial)
                                        .mask {
                                            Image(frontFolder)
                                                .resizable()
                                                .scaledToFit()
                                        }
                                    Rectangle()
                                        .fill(.thickMaterial)
                                        .mask {
                                            Image(frontFolder)
                                                .resizable()
                                                .scaledToFit()
                                        }
                                }
                                .overlay {
                                    Image(frontFolder)
                                        .resizable()
                                        .scaledToFit()
                                }
                                .overlay {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Image(systemName: icon)
                                                .font(.system(size: size * 0.11))
                                                .minimumScaleFactor(0.7)
                                                .foregroundStyle(colorInformations)
                                            
                                            Spacer()
                                            
                                            Text(text)
                                                .font(.system(size: size * 0.12))
                                                .fontWeight(.medium)
                                                .minimumScaleFactor(0.7)
                                                .foregroundStyle(colorInformations)
                                        }
                                        .padding(size * 0.09)
                                        Spacer()
                                    }
                                }
                        }
                    }
                        .frame(width: size, height: size)
                        .environment(\.colorScheme, .light)
                )
            }
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

#Preview {
    Folders(destination: UserProfileScreen(), icon: "calendar", iconBack: "calendar", colorFolder: .yellowFolder, frontFolder: "FrontYellowFolder", colorInformations: .yellowDetailsFolder, text: "Cronograma")
}
