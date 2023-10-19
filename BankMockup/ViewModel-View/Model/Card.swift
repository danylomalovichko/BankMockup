//
//  Card.swift
//  BankMockup
//
//  Created by Danylo Malovichko on 18.10.2023.
//

import Foundation

struct Card: Identifiable {
    let id: String
    let number: String
    let name: String
    let balance: Double
    let transactions: [Transaction]
    let imageName: String
}

