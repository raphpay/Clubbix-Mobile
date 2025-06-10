//
//  RegisterView.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

enum AccountType: String, Codable, CaseIterable {
	case member = "Membre"
	case club = "Club"


}

struct RegisterView: View {
	@State private var accountType: AccountType = .member

	@State private var clubName = ""
	@State private var userName = ""
	@State private var userFirstName = ""
	@State private var email = ""
	@State private var password = ""

    var body: some View {
		ScrollView {
			Spacer()
			Text("Clubbix")
				.font(.title)


			Picker("Choisir un type de compte", selection: $accountType) {
				ForEach(AccountType.allCases, id: \.self) {
					Text($0.rawValue)
				}
			}
			.pickerStyle(.segmented)

			Spacer()

			informationForm

			Spacer()
			ClubbixPrimaryButton(title: "S'inscrire") {
				//
			}

			ClubbixTextButton(title: "Déjà un compte ?") {
				//
			}

			Spacer()
		}
		.navigationTitle("Créer un compte")
		.padding()
		.background(Color.background)
    }

	var informationForm: some View {
		VStack(alignment: .leading) {
			if accountType == .club {
				Section {
					ClubbixTextField(placeholder: "Nom du club", text: $clubName)
				} header: {
					Text("Informations du club")
				}
			} else {
				Section {
					ClubbixTextField(placeholder: "Code d'invitation du club", text: $clubName)
				} footer: {
					Text("L'administrateur du club vous donnera un code d'invitation pour vous inscrire au club.")
						.font(.caption)
				}
			}

			Divider()

			Section {
				ClubbixTextField(placeholder: "Nom", text: $userName)
				ClubbixTextField(placeholder: "Prénom", text: $userFirstName)
				ClubbixTextField(placeholder: "Email", text: $email)
				ClubbixTextField(placeholder: "Mot de passe", text: $password)
			} header: {
				Text("Vos informations")
					.padding(.vertical)
			}
		}
		.formStyle(.automatic)
		.padding(.vertical)
	}
}

#Preview {
	RegisterView()
}
