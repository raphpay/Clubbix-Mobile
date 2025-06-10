//
//  ClubbixTextField.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

struct ClubbixTextField: View {
	var placeholder: String
	var textInputAutocapitalization: TextInputAutocapitalization = .words
	var keyboardType: UIKeyboardType = UIKeyboardType.default

	@Binding var text: String

    var body: some View {
		VStack(alignment: .leading) {
			Text(placeholder)

			TextField(placeholder, text: $text)
				.textInputAutocapitalization(textInputAutocapitalization)
				.keyboardType(keyboardType)
				.textFieldStyle(.roundedBorder)
		}
    }
}
