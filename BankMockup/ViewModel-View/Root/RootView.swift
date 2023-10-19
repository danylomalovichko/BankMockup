//
//  RootView.swift
//  BankMockup
//
//  Created by Danylo Malovichko on 18.10.2023.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        HomeView(vm: .init(appState.container))
    }
}
