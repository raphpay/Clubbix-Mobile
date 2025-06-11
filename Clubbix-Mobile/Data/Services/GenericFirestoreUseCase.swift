//
//  GenericFirestoreUseCase.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 11/06/2025.
//

import Foundation
import FirebaseFirestore
import Combine

class GenericFirestoreService<T: Codable & Identifiable>: FirestoreRepository {
	typealias Entity = T

	private let collectionName: String
	private let db = Firestore.firestore()

	init(collectionName: String) {
		self.collectionName = collectionName
	}

	func fetchAll() async throws -> [T] {
		do {
			let snapshot = try await db.collection(collectionName).getDocuments()
			let items = try snapshot.documents.compactMap {
				try $0.data(as: T.self)
			}
			return items
		} catch {
			throw error
		}
	}

	func fetch(id: String) async throws -> T {
		do {
			let document = try await db.collection(collectionName).document(id).getDocument()
			let item = try document.data(as: T.self)
			return item
		} catch {
			throw error
		}
	}

	func query(on field: String, value: String) async throws -> T? {
		print("query \(field) \(value) \(collectionName)")
		do {
			let snapshot = try await db.collection(collectionName)
				.whereField(field, isEqualTo: value)
				.limit(to: 1)
				.getDocuments()

			return try snapshot.documents.first?.data(as: T.self)
		} catch {
			throw error
		}
	}

	func add(_ entity: T) throws {
		do {
			try db.collection(collectionName)
				.document(entity.id as! String)
				.setData(from: entity)
		} catch {
			throw error
		}
	}

	func update(_ entity: T) throws {
		try add(entity) // same as add in Firestore if ID is the same
	}

	func delete(id: String) async throws {
		do {
			try await db.collection(collectionName).document(id).delete()
		} catch {
			throw error
		}
	}
}
