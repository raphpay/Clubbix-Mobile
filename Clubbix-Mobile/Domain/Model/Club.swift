//
//  Club.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 11/06/2025.
//

import Foundation

struct Club: Identifiable, Codable {
	let id: String
	var address: String
	var inviteCode: String
	var logoPath: String
	var members: [String]
	var name: String
	var socialAccounts: SocialAccount
	var searchQuery: String
}

struct SocialAccount: Codable {
	var facebookUrl: String
	var instagramUrl: String
}
