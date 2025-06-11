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
	@StateObject private var viewModel = RegisterViewModel()

    var body: some View {
		ScrollView {
			Spacer()
			Text("Clubbix")
				.font(.title)


			Picker("Choisir un type de compte", selection: $viewModel.accountType) {
				ForEach(AccountType.allCases, id: \.self) {
					Text($0.rawValue)
				}
			}
			.onChange(of: viewModel.accountType, { _, newValue in
				viewModel.reset()
			})
			.pickerStyle(.segmented)

			Spacer()

			informationForm

			Spacer()

			if viewModel.step == 1 {
				ClubbixTextButton(title: "Continuer") {
					withAnimation {
						viewModel.tapContinueButton()
					}
				}
			} else {
				ClubbixPrimaryButton(title: "S'inscrire") {
					//
				}
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
			if viewModel.accountType == .club {
				Section {
					if viewModel.step == 1 {
						ClubbixTextField(placeholder: "Nom du club", text: $viewModel.clubName)
							.onChange(of: viewModel.clubName, { oldValue, newValue in
								if !newValue.isEmpty { viewModel.wrongClubNameAttempts = 0 }
							})
							.shake(animatableData: CGFloat(viewModel.wrongClubNameAttempts))

						if viewModel.wrongClubNameAttempts >= 3 {
							Text("Veuillez remplir le code d'invitation du club pour continuer")
								.foregroundStyle(.error)
						}
					} else {
						ClubInfoLine(text: viewModel.clubName) {
							print("club name")
							withAnimation {
								viewModel.step = 1
							}
						}
					}
				} header: {
					Text("Informations du club")
				}
			} else {
				Section {
					if viewModel.step == 1 {
						ClubbixTextField(placeholder: "Code d'invitation du club", text: $viewModel.clubCode)
							.onChange(of: viewModel.clubCode, { oldValue, newValue in
								if !newValue.isEmpty { viewModel.wrongClubCodeAttempts = 0 }
							})
							.shake(animatableData: CGFloat(viewModel.wrongClubCodeAttempts))

						if viewModel.wrongClubCodeAttempts >= 3 {
							Text("Veuillez remplir le code d'invitation du club pour continuer")
								.foregroundStyle(.error)
						}
					} else {
						ClubInfoLine(text: viewModel.clubCode) {
							withAnimation {
								viewModel.step = 1
							}
						}
					}
				} footer: {
					if viewModel.step == 1 {
						Text("L'administrateur du club vous donnera un code d'invitation pour vous inscrire au club.")
							.font(.caption)
					}
				}
			}

			Divider()

			if viewModel.step == 2 {
				Section {
					ClubbixTextField(placeholder: "Nom", text: $viewModel.userName)
					ClubbixTextField(placeholder: "Prénom", text: $viewModel.userFirstName)
					ClubbixTextField(placeholder: "Email", text: $viewModel.email)
					ClubbixTextField(placeholder: "Mot de passe", text: $viewModel.password)
				} header: {
					Text("Vos informations")
						.padding(.vertical)
				}
			}
		}
		.formStyle(.automatic)
		.padding(.vertical)
	}
}

struct ClubInfoLine: View {
	var text: String
	var action: () -> Void

	var body: some View {
		HStack {
			Text(text)
			Spacer()
			Button {
				action()
			} label: {
				Image(systemName: "pencil.line")
			}
		}
	}
}

#Preview {
	RegisterView()
}
