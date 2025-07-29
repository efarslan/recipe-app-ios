//
//  login_view.swift
//  recipe-app-ios
//
//  Created by efe arslan on 27.07.2025.
//

import SwiftUI

struct login_view: View {
    @State private var shouldNavigate = false
    @EnvironmentObject var session: user_session
    @StateObject private var viewModel: LoginViewModel
    
    init(session: user_session) {
        _viewModel = StateObject(wrappedValue:  LoginViewModel(session: session))
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Text("Giriş Yap")
                    .font(.largeTitle)
                    .bold()
                
                //Fieldlar
                TextField("E-posta", text: $viewModel.email)
                    .padding()
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .autocapitalization(.none)
                    
                
                SecureField("Şifre", text: $viewModel.password)
                    .padding()
                    .cornerRadius(30)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1))
                
                
                //Sifremi Unuttum
                HStack {
                    Spacer()
                    Text("Şifremi Unuttum")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .padding(.trailing, 10)
                .padding(.bottom, 20)
                
                
                
                //Giris Yap Butonu
                Button(action: {
                    viewModel.login()
                    if session.isLoggedIn {
                        shouldNavigate = true
                    }
                    
                }) {
                    Text("Giriş Yap")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                
                // Kayit Ol
                HStack {
                    Text("Hesabın yok mu?")
                    NavigationLink(destination: register_view(session: session)) {
                        Text("Kayıt Ol")
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.top, 10)
            }
            .padding()
            .navigationDestination(isPresented: $shouldNavigate) {
                home_view()
            }
        }
    }
}

#Preview {
    let previewSession = user_session()
    login_view(session: previewSession)
        .environmentObject(previewSession)
}
