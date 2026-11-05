//
//  LoginScreen.swift
//  BlackBird
//
//  Created by Ana Clara Fornazier on 05/11/26.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
        @State var text: String = ""
        
        NavigationStack{
            ZStack{
                Color.background
                    .ignoresSafeArea()
                
                VStack{
                    Text("BlackBird")
                        .font(.custom ("BonaNova-Regular", size: 30))
                        .foregroundStyle(.principalYellow)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    Image("Jubileu")
                    
                    TextField("Digite seu e-mail educacional", text: $text)
                        .font(.custom ("DMSans-Regular", size: 13))
                        .foregroundColor(.secondary)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundStyle(.quinary)
                                .frame(width: 350, height: 40)
                            
                        ).padding(.horizontal, 40)
                        .padding(.bottom)
                    
                    TextField("Senha", text: $text)
                        .font(.custom ("DMSans-Regular", size: 13))
                        .foregroundColor(.secondary)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundStyle(.quinary)
                                .frame(width: 350, height: 40)
                            
                        ).padding(.horizontal, 40)
                        .padding(.bottom,40)
                    
                    NavigationLink{
                        HomeScreen()
                    } label: {
                        Text("Entrar")
                            .font(.custom ("DMSans-Bold", size: 16))
                            .foregroundStyle(.principalBlack)
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .foregroundStyle(.principalYellow)
                                    .frame(width: 200, height: 40)
                            )
                        
                    }.padding(.bottom,40)
                    
                    Text("Esqueci minha senha")
                        .font(.custom("DMSans-Regular", size: 13))
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                }
            }
        }
    }
}

#Preview {
    LoginScreen()
}
