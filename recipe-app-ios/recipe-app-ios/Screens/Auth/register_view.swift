//
//  register_view.swift
//  recipe-app-ios
//
//  Created by efe arslan on 27.07.2025.
//

import SwiftUI

struct register_view: View {
    @EnvironmentObject var session: user_session
    @StateObject private var viewModel: RegisterViewModel

    init(session: user_session) {
        _viewModel = StateObject(wrappedValue: RegisterViewModel(session: session))
    }
    
    var body: some View {
        VStack {
            Text("Kayıt Ol")
                .font(.largeTitle)
                .bold()

            VStack(spacing: 15) {
                TextField("Ad Soyad", text: $viewModel.fullName)
                    .padding()
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )

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
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )

                SecureField("Şifre Tekrar", text: $viewModel.confirmPassword)
                    .padding()
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )

                Button(action: {
                    viewModel.register()
                }) {
                    Text("Kayıt Ol")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
            }
        }
        .padding()
    }
}

#Preview {
    register_view(session: user_session())
        .environmentObject(user_session())
}
