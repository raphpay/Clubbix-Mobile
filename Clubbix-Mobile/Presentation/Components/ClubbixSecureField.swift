//
//  ClubbixSecureField.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

struct ClubbixSecureField: View {
	var placeholder: String
	@Binding var text: String

	var body: some View {
		VStack(alignment: .leading) {
			Text(placeholder)

			SecureField(placeholder, text: $text)
				.textFieldStyle(.roundedBorder)
		}
	}
}
