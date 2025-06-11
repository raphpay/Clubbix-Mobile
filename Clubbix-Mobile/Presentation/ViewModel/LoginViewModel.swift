//
//  LoginViewModel.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
	@Published var email: String = ""
	@Published var password: String = ""
}

