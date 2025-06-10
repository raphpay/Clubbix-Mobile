//
//  LoginView.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

struct LoginView: View {
	@State private var email = ""
	@State private var password = ""

    var body: some View {
		VStack {
			Text("Clubbix")
				.font(.title)
				.fontWeight(.bold)
			Spacer()
			ClubbixTextField(placeholder: "Email", text: $email)
			Divider()
			ClubbixTextField(placeholder: "Mot de passe", text: $password)
			Spacer()

			ClubbixPrimaryButton(title: "Se connecter") {
				print("Se connecter")
			}

			ClubbixTextButton(title: "Créer un compte") {
				//
			}
		}
		.padding()
		.background(Color.background)
    }
}

#Preview {
    LoginView()
}
