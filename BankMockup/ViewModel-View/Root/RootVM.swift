//
//  RootVM.swift
//  BankMockup
//
//  Created by Danylo Malovichko on 18.10.2023.
//

import Foundation

@MainActor
class RootVM: ObservableObject {
    let container: DependencyContainer
    
    init(_ container: DependencyContainer) {
        self.container = container
    }
}
