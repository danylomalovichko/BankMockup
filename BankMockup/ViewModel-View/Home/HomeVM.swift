//
//  HomeVM.swift
//  BankMockup
//
//  Created by Danylo Malovichko on 18.10.2023.
//

import Foundation
import Combine

@MainActor
class HomeVM: BaseVM {
    
    @Published var cards: [Card] = []
    @Published var recentTransaction: [Transaction] = []
    @Published var balance: Double = 0
        
    override init(_ container: DependencyContainer) {
        super.init(container)
        
        container.dataService.cards
            .compactMap { $0 }
            .assign(to: &$cards)
        
        container.dataService.recentTransaction
            .compactMap { $0 }
            .assign(to: &$recentTransaction)
        
        container.dataService.balance
            .compactMap { $0 }
            .assign(to: &$balance)
    }
}
