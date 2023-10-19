//
//  BankMockupApp.swift
//  BankMockup
//
//  Created by Danylo Malovichko on 18.10.2023.
//

import SwiftUI

@main
struct BankMockupApp: App {
    
    @StateObject var appState = AppState(container: DependencyContainer())
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                    RootView()
                        .environmentObject(appState)
            }
        }
    }
}
