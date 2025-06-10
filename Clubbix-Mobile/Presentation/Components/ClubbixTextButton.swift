//
//  ClubbixTextButton.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

struct ClubbixTextButton: View {
	var title: String
	var action: () -> Void

	var body: some View {
		Button(action: action) {
			Text(title)
		}
		.foregroundStyle(Color.customPrimary)
	}
}
