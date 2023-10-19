//
//  DataService.swift
//  BankMockup
//
//  Created by Danylo Malovichko on 18.10.2023.
//

import Foundation
import Combine

@MainActor
protocol DataService {
    var cards: CurrentValueSubject<[Card]?, Never> { get }
    var recentTransaction: CurrentValueSubject<[Transaction]?, Never> { get }
    var balance: CurrentValueSubject<Double?, Never> { get }
}

class DataManager: DataService {
    
    let cards = CurrentValueSubject<[Card]?, Never>(nil)
    let recentTransaction = CurrentValueSubject<[Transaction]?, Never>(nil)
    let balance = CurrentValueSubject<Double?, Never>(nil)

    init() {
        
        let transactions: [Transaction] = [
            .init(id: UUID().uuidString, date: Date() , company: "Slack", amount: 25.17, status: .declined, receipt: false, currency: "GBP", imageName: "Slack" , number: "5555555555554123"),
            .init(id: UUID().uuidString, date: Date(), company: "Notion", amount: 350, status: .accepted, receipt: true, currency: "USD", imageName: "Notion", number: "555555555555416544"),
            .init(id: UUID().uuidString, date: Date(), company: "Slack", amount: -17.8, status: .accepted, receipt: false, currency: "EUR", imageName: "Slack" , number: "5555555555550973"),
            .init(id: UUID().uuidString, date: Date(), company: "Google", amount: -25, status: .accepted, receipt: true, currency: "GBP", imageName: "Google" , number: "5555555555557423"),
            .init(id: UUID().uuidString, date: Date(), company: "Notion", amount: 100, status: .accepted, receipt: true, currency: "USD", imageName: "Notion" , number: "5555555555554433")
        ]
        
        let cards: [Card] = [
            .init(id: "1", number: "5555555555554123", name: "Slack", balance: 870, transactions: transactions, imageName: "Slack"),
            .init(id: "2", number: "5555555555554456", name: "Google", balance: 30, transactions: transactions, imageName: "Google"),
            .init(id: "3", number: "5555555555554789", name: "Notion", balance: 100, transactions: transactions, imageName: "Notion")
        ]
        
        self.cards.send(cards)
        
        self.recentTransaction.send(transactions)
        self.recentTransaction.send(transactions)
        self.recentTransaction.send(transactions)
        self.recentTransaction.send(transactions)
        
        let balance = cards
            .map { $0.balance }
            .reduce(0, +)
        
        self.balance.send(balance)
    }
}
