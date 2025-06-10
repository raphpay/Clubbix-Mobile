//
//  ClubbixSecureField.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

enum PasswordStrength {
	case weak, medium, strong

	var description: String {
		switch self {
		case .weak:
			return "Mot de passe faible"
		case .medium:
			return "Mot de passe moyen"
		case .strong:
			return "Mot de passe fort"
		}
	}

	var color: Color {
		switch self {
		case .weak:
			return .clubbixError
		case .medium:
			return .orange
		case .strong:
			return .clubbixSuccess
		}
	}
}

struct ClubbixSecureField: View {
	var placeholder: String
	var showStrength: Bool = false
	@Binding var text: String
	@State private var passwordStrength: PasswordStrength = .weak

	var body: some View {
		VStack(alignment: .leading) {
			Text(placeholder)

			SecureField(placeholder, text: $text)
				.textFieldStyle(.roundedBorder)
				.onChange(of: $text.wrappedValue) { _, newValue in
					if showStrength { calculateStrength(newValue) }
				}

			if !text.isEmpty && showStrength {
				Text(passwordStrength.description)
					.foregroundStyle(passwordStrength.color)
					.animation(.easeInOut)
			}
		}
	}

	func calculateStrength(_ value: String) {
		var strengthIndex = 0
		if value.count >= 8 {
			strengthIndex += 1
		}

		// Check for special characters
		let specialCharactersRegex = "/[,.;?:/=+!/(/)///]"
		if value.range(of: specialCharactersRegex, options: .regularExpression) != nil && value.count >= 8 {
			strengthIndex += 1
		}

		// Check for numbers
		let numberRegex = "\\d"
		if value.range(of: numberRegex, options: .regularExpression) != nil && value.count >= 8 {
			strengthIndex += 1
		}

		switch strengthIndex {
		case 0:
			passwordStrength = .weak
		case 1:
			passwordStrength = .medium
		case 2:
			passwordStrength = .strong
		default:
			passwordStrength = .weak
		}
	}
}
