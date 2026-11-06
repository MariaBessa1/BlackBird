//
//  LoginScreen.swift
//  BlackBird
//
//  Created by Ana Clara Fornazier on 05/11/26.
//

import SwiftUI

struct LoginScreen: View {
    
    var onLogin: () -> Void
    @State var email: String = ""
    @State var senha: String = ""
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color.background
                    .ignoresSafeArea()
                
                VStack{
                    Text("BlackBird")
                        .font(.custom ("BonaNovaSC-Regular", size: 30))
                        .foregroundStyle(.principalYellow)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    Image("Jubileu")
                    
                    Spacer()
                    
                    // Campo de e-mail
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("E-mail")
                            .font(.custom("DMSans-SemiBold", size: 17, relativeTo: .subheadline))
                            .foregroundStyle(.primary)
                        
                        TextField("Digite seu e-mail educacional", text: $email)
                            .font(.custom("DMSans-Regular", size: 17, relativeTo: .body))
                            .padding(.horizontal, 16)
                            .frame(height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .foregroundStyle(.quinary)
                            )
                    }
                    
                    // Campo de senha
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Senha")
                            .font(.custom("DMSans-SemiBold", size: 17, relativeTo: .subheadline))
                            .foregroundStyle(.primary)
                        
                        SecureField("Digite sua senha", text: $senha)
                            .font(.custom("DMSans-Regular", size: 17, relativeTo: .body))
                            .padding(.horizontal, 16)
                            .frame(height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .foregroundStyle(.quinary)
                            )
                    }
                    
                    Spacer()
                    
                    //                    NavigationLink{
                    //                        MainTabView()
                    //                    } label: {
                    //                        Text("Entrar")
                    //                            .font(.custom ("DMSans-Bold", size: 16))
                    //                            .foregroundStyle(.principalBlack)
                    //                            .background(
                    //                                RoundedRectangle(cornerRadius: 40)
                    //                                    .foregroundStyle(.principalYellow)
                    //                                    .frame(width: 200, height: 60)
                    //                            )
                    //                    }
                    //                    .padding(24)
                    
                    Button {
                        onLogin()
                    } label: {
                        Text("Entrar")
                            .font(.custom("DMSans-Bold", size: 16, relativeTo: .body))
                            .foregroundStyle(.principalBlack)
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                    .foregroundStyle(.principalYellow)
                                    .frame(width: 200, height: 60)
                            )
                    }
                    .padding(24)
                }
                .padding(40)
            }
        }
    }
}

#Preview {
    LoginScreen(onLogin: {})
}
