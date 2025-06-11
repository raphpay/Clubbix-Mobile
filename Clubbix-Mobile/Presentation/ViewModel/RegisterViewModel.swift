//
//  RegisterViewModel.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import Foundation

final class RegisterViewModel: ObservableObject {
	@Published var accountType: AccountType = .member
	@Published var clubName = ""
	@Published var clubCode = ""
	@Published var userName = ""
	@Published var userFirstName = ""
	@Published var email = ""
	@Published var password = ""
	@Published var step = 1
	@Published var wrongClubNameAttempts = CGFloat(0)
	@Published var wrongClubCodeAttempts = CGFloat(0)

	func tapContinueButton() {
		accountType == .member ? checkClubCode() : checkClubName()
	}

	func checkClubCode() {
		if !clubCode.isEmpty {
			step += 1
		} else {
			wrongClubNameAttempts += 1
		}
	}

	func checkClubName() {
		if !clubName.isEmpty {
			step += 1
		} else {
			wrongClubCodeAttempts += 1
		}
	}

	func reset() {
		step = 1
		clubName = ""
		clubCode = ""
		wrongClubCodeAttempts = 0
		wrongClubNameAttempts = 0
	}
}
