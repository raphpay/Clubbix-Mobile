//
//  RegisterViewModel.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

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
	@Published var isLoading = false

	let clubUseCase = ClubUseCase()

	func tapContinueButton() async throws {
		try await accountType == .member ? checkClubCode() : checkClubName()
	}

	func checkClubCode() async throws {
		DispatchQueue.main.async {
			self.isLoading = true
		}
		if !clubCode.isEmpty {
			do {
				if let club = try await clubUseCase.getClubByCode(clubCode) {
					handleResponse(success: true)
				} else {
					handleResponse(success: false)
				}
			} catch {
				handleResponse(success: false)
				throw error
			}
		} else {
			handleResponse(success: false)
		}
	}

	func checkClubName() async throws {
		DispatchQueue.main.async {
			self.isLoading = true
		}
		if !clubName.isEmpty {
			do {
				if let club = try await clubUseCase.getClubByName(clubName) {
					// A club was found -> the user needs to choose another one
					handleResponse(for: .club, success: true)
				} else {
					handleResponse(for: .club, success: false)
				}
			} catch {
				handleResponse(for: .club, success: false)
				throw error
			}
		} else {
			handleResponse(for: .club, success: false)
		}
	}

	func reset() {
		step = 1
		clubName = ""
		clubCode = ""
		wrongClubCodeAttempts = 0
		wrongClubNameAttempts = 0
	}

	private func handleResponse(for accountType: AccountType = .club, success: Bool) {
		DispatchQueue.main.async {
			withAnimation {
				self.isLoading = false
				if success {
					self.step += 1
				} else {
					if accountType == .member {
						self.wrongClubCodeAttempts += 1
					} else {
						self.wrongClubNameAttempts += 1
					}
				}
			}
		}
	}
}
