//
//  FirestoreRepository.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 11/06/2025.
//

import Combine
import Foundation

protocol FirestoreRepository {
	associatedtype Entity: Identifiable & Codable

	func fetchAll() async throws -> [Entity]
	func fetch(id: String) async throws -> Entity
	func query(on field: String, value: String) async throws -> Entity?
	func add(_ entity: Entity) throws
	func update(_ entity: Entity) throws
	func delete(id: String) async throws
}
