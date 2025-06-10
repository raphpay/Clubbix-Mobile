//
//  ClubbixPrimaryButton.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//


import SwiftUI

struct ClubbixPrimaryButton: View {
	var title: String
	var action: () -> Void

	var body: some View {
		Button(action: action) {
			Text(title)
		}
		.padding()
		.background(Color.customPrimary)
		.foregroundStyle(.white)
		.clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
	}
}
