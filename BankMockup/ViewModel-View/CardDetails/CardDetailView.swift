//
//  CardDetailView.swift
//  BankMockup
//
//  Created by Danylo Malovichko on 18.10.2023.
//

import SwiftUI

struct CardDetailView: View {
    
    @Binding var card: Card?
    
    var body: some View {
        VStack {
            header()
            
            activityBar()
            
            activityBarContent()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "F6F7F9"))
    }
}


// MARK: Views
private extension CardDetailView {
    
    @ViewBuilder func header() -> some View {
        HStack {
            Button {
                card = nil
            } label: {
                Image("BackArrow")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
            }
            
            Spacer(minLength: 0)
            
            Circle()
                .frame(width: 44, height: 44)
                .foregroundColor(.white)
                .overlay {
                    Image(card?.imageName ?? .init())
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                }
            
            Text(card?.name ?? "")
                .font(Font.Inter.medium(size: 16))
                .foregroundColor(Color.Style.blackText)
            
            Text(hiddenCardNumber(cardNumber: card?.number))
                .font(Font.Inter.medium(size: 12))
                .foregroundColor(Color(hex: "7E8493"))
                .padding(.trailing, 44)
            
            
            Spacer(minLength: 0)
            
        }
        .frame(height: 44)  
    }
    
    @ViewBuilder func activityBar() -> some View {
        VStack(spacing: 0) {
            Image("CardPreview")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 343, height: 88)
            
            HStack(spacing: 0) {
                
                VStack(spacing: 0) {
                    Button {
                        
                    } label: {
                        VStack(spacing: 0 ) {
                            Image("Eye")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            Text("Details")
                                .foregroundColor(Color.Style.blackText)
                                .padding(.top, 8)
                                .font(Font.Inter.medium(size: 12))
                            
                        }
                    }
                }
                .frame(width: 80, height: 72)
                
                VStack(spacing: 0) {
                    Button {
                        
                    } label: {
                        VStack(spacing: 0 ) {
                            Image("Lock")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            Text("Lock")
                                .foregroundColor(Color.Style.blackText)
                                .padding(.top, 8)
                                .font(Font.Inter.medium(size: 12))
                            
                        }
                    }
                }
                .frame(width: 80, height: 72)
                
                VStack(spacing: 0) {
                    Button {
                        
                    } label: {
                        VStack(spacing: 0 ) {
                            Image("ClosedCard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            
                            Text("Terminate")
                                .foregroundColor(Color.Style.blackText)
                                .padding(.top, 8)
                                .font(Font.Inter.medium(size: 12))
                            
                        }
                    }
                }
                .frame(width: 80, height: 72)
                
            }
            .padding(.horizontal, 12)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.white)
            }
            .padding(.top, 16)
        }
    }
    
    @ViewBuilder func activityBarContent() -> some View {
        
        VStack {
            
            Text("Activity")
                .font(Font.Inter.semiBold(size: 16))
                .foregroundColor(Color.Style.blackText)
                .padding(.vertical, 34)
            
            ScrollView {
                
                HStack {
                    Text(card?.transactions.first?.date ?? .init(), format: Date.FormatStyle(date: .abbreviated, time: .none))
                        .padding(.horizontal, 16)
                        .font(Font.Inter.medium(size: 14))
                        .foregroundColor(Color(hex: "7E8493"))
                    
                    Spacer(minLength: 0)
                }
                .frame(maxWidth: .infinity)
                
                Divider()
                    .padding(.horizontal, 16)
                
                ForEach(card?.transactions ?? []) { transaction in
                    HStack {

                        Circle()
                            .frame(width: 44, height: 44)
                            .foregroundColor(Color(hex: "F6F7F9"))
                                .overlay {
                                Image("DarkCard")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                            }
                            .overlay {
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.red)
                                    .padding(.leading, 33)
                                    .padding(.top, 33)
                                    .opacity(transaction.status == .declined ? 1 : 0)
                            }
                        
                        VStack(alignment: .leading) {
                            
                            Text(transaction.company)
                                .foregroundColor(Color.Style.blackText)
                                .font(Font.Inter.medium(size: 16))
                            
                            if transaction.status == .declined {
                                Text("Declined")
                                    .font(Font.Inter.medium(size: 14))
                                    .foregroundColor(Color(hex: "EC5454"))
                            }
                        }
                                                
                        Spacer(minLength: 0)
                        
                        Text("\(transaction.amount.formatted(.currency(code: transaction.currency)))")
                            .strikethrough(transaction.status == .declined,
                                           color: amountColor(transaction))
                            .foregroundColor(amountColor(transaction))
                        
                        Image(transaction.receipt == true ? "GoodReceipt" : "BadReceipt")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .opacity(transaction.status == .declined ? 0 : 1)
                            
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
    }
}

// MARK: Functions
private extension CardDetailView {
    
    func hiddenCardNumber(cardNumber: String?) -> String {
        guard let cardNumber = cardNumber else {
            return ""
        }
        
        return "••\(cardNumber.suffix(4))"
    }
    
    func amountColor(_ transaction: Transaction) -> Color {
        if transaction.status == .declined {
           return Color(hex: "7E8493")
        } else {
            if transaction.amount > 0 {
                return Color(hex: "00AC4F")
            } else {
                return .black
            }
        }
    }
}
