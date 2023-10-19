//
//  Transaction.swift
//  BankMockup
//
//  Created by Danylo Malovichko on 18.10.2023.
//

import Foundation

struct Transaction: Identifiable {
    let id: String
    let date: Date
    let company: String
    let amount: Double
    let status: Status
    let receipt: Bool
    let currency: String
    let imageName: String
    let number: String
}
