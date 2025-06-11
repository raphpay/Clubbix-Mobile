//
//  LoginView.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

struct LoginView: View {
	@StateObject private var viewModel = LoginViewModel()
	@State private var path = NavigationPath()

	var body: some View {
		NavigationStack(path: $path) {
			VStack {
				Text("Clubbix")
					.font(.title)
					.fontWeight(.bold)
				Spacer()
				ClubbixTextField(placeholder: "Email",
								 textInputAutocapitalization: .never,
								 keyboardType: .emailAddress,
								 text: $viewModel.email)
				Divider()
				ClubbixSecureField(placeholder: "Mot de passe", text: $viewModel.password)
				Spacer()

				ClubbixPrimaryButton(title: "Se connecter") {
					print("Se connecter")
				}

				ClubbixTextButton(title: "Créer un compte") {
					path.append("register")
				}
			}
			.padding()
			.background(Color.background)
			.navigationDestination(for: String.self) { value in
				if value == "register" {
					RegisterView(path: $path)
				}
			}
		}
	}
}

#Preview {
    LoginView()
}
