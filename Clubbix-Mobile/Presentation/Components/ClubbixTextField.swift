//
//  ClubbixTextField.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

struct ClubbixTextField: View {
	var placeholder: String
	@Binding var text: String

    var body: some View {
		VStack(alignment: .leading) {
			Text(placeholder)

			TextField(placeholder, text: $text)
				.textFieldStyle(.roundedBorder)
		}
    }
}
