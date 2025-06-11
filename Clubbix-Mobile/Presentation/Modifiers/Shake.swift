//
//  Shake.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

struct Shake: GeometryEffect {
	var amount: CGFloat = 10
	var shakesPerUnit = 3
	var animatableData: CGFloat

	func effectValue(size: CGSize) -> ProjectionTransform {
		ProjectionTransform(CGAffineTransform(translationX:
			amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
			y: 0))
	}
}

extension View {
	func shake(_ amount: CGFloat = 10, shakesPerUnit: Int = 3, animatableData: CGFloat) -> some View {
		modifier(Shake(amount: amount, shakesPerUnit: shakesPerUnit, animatableData: animatableData))
	}
}

struct ContentView: View {
	@State var attempts: Int = 0

	var body: some View {
		VStack {
			Rectangle()
				.fill(Color.pink)
				.frame(width: 200, height: 100)
				.modifier(Shake(animatableData: CGFloat(attempts)))
			Spacer()
			Button(action: {
				withAnimation(.default) {
					self.attempts += 1
				}

			}, label: { Text("Login") })
		}
	}
}
