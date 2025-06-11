//
//  ClubService.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 11/06/2025.
//

import Foundation

final class ClubService: GenericFirestoreService<Club> {
	init() {
		super.init(collectionName: "clubs")
	}

}
