//
//  DependencyContainer.swift
//  BankMockup
//
//  Created by Danylo Malovichko on 18.10.2023.
//

import Foundation

@MainActor
class DependencyContainer {
    
   let dataService: DataService

    init() {
        dataService = DataManager()
    }
}
