//
//  ClubUseCase.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 11/06/2025.
//

import Foundation
import Combine

final class ClubUseCase {
	private let service: ClubService

	init(service: ClubService = ClubService()) {
		self.service = service
	}

	func fetchAll() async throws -> [Club] {
		do {
			let all = try await service.fetchAll()
			return all
		} catch {
			throw error
		}
	}

	func getClubByCode(_ code: String) async throws -> Club? {
		do {
			return try await service.query(on: "inviteCode", value: code)
		} catch {
			throw error
		}
	}

	func getClubByName(_ name: String) async throws -> Club? {
		do {
			return try await service.query(on: "name", value: name)
		} catch {
			throw error
		}
	}
}
