//
//  Clubbix_MobileApp.swift
//  Clubbix-Mobile
//
//  Created by Raphaël Payet on 10/06/2025.
//

import SwiftUI

@main
struct Clubbix_MobileApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
    var body: some Scene {
        WindowGroup {
			LoginView()
        }
    }
}
