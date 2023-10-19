//
//  ContentView.swift
//  BankMockup
//
//  Created by Danylo Malovichko on 18.10.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeVM
    
    @State var cardDetails: Card?
    
    var body: some View {
        TabView {
            mainContent()
                .tabItem {
                    Image("Home")
                        .renderingMode(.template)
                    Text("Home")
                }
            
            Text("Transactions")
                .tabItem {
                    Image("HorizontalLines")
                        .renderingMode(.template)
                    Text("Transactions")
                }
            Text("My Cards")
                .tabItem {
                    Image("Card")
                        .renderingMode(.template)
                    Text("My Cards")
                }
            Text("My Profile")
                .tabItem {
                    Image("Person")
                        .renderingMode(.template)
                    Text("Account")
                }
        }
    }
}

// MARK: Views
private extension HomeView {
    
    @ViewBuilder func mainContent() -> some View {
        if cardDetails == nil {
            MainView()
        } else {
            CardDetailView(card: $cardDetails)
        }
    }
    
    @ViewBuilder func MainView() -> some View {
        VStack {
            
            header()
            
            account()
            
            myCards()
            
            recentTransactions()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Style.background)
    }
    
    @ViewBuilder func header() -> some View {
        HStack {
            
            Text("Money")
                .foregroundColor(Color.Style.blackText)
                .font(Font.Inter.extraBold(size: 32))
            
            Spacer(minLength: 0)
            
            Button {
                
            } label: {
                Image("Plus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)
            }
            
            Button {
                
            } label: {
                Image("Bank")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)
            }
        }
        .frame(height: 44)
        .padding(.horizontal, 16)
        Divider()
            .padding(.horizontal, 16)
    }
    
    @ViewBuilder func account() -> some View {
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 343, height: 100)
            .foregroundColor(.white)
            .overlay {
                VStack {
                    HStack {
                        Image("USAFlag")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 16)
                        
                        Text("USD account")
                            .font(Font.Inter.medium(size: 16))
                            .foregroundColor(Color(hex: "21222E"))
                        
                        Spacer(minLength: 0)
                    }
                    
                    HStack {
                        
                        Text("\(vm.balance.formatted(.currency(code: "USD")))")
                            .font(Font.Inter.extraBold(size: 28))
                            .foregroundColor(Color(hex: "21222E"))
                        
                        Spacer(minLength: 0)
                        
                    }
                }
                .padding(.horizontal, 16)
            }
        
    }
    
    @ViewBuilder func myCards() -> some View {
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 343, height: 240)
            .foregroundColor(.white)
            .overlay {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("My cards")
                            .font(Font.Inter.semiBold(size: 16))
                            .padding(.top, 16)
                            .foregroundColor(Color.Style.blackText)
                        
                        Spacer(minLength: 0)
                        
                        Button {
                            
                        } label: {
                            Text("See all")
                                .font(Font.Inter.medium(size: 14))
                                .padding(.top, 19)
                                .underline()
                                .foregroundColor(Color.Style.blackText)
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    VStack(spacing: 0) {
                        ForEach(vm.cards) { card in
                            
                            Button {
                                cardDetails = card
                            } label: {
                                HStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: 48, height: 32)
                                        .foregroundColor(Color.Style.blackText)
                                        .overlay {
                                            
                                            Circle()
                                                .frame(width: 28,height: 28)
                                                .foregroundColor(Color(hex: "F6F7F9"))
                                                .overlay {
                                                    Image(card.imageName)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 16,height: 16)
                                                }
                                                .padding(.top, -28)
                                                .padding(.leading, -33)
                                            
                                            Text(card.number.suffix(4))
                                                .font(Font.Inter.semiBold(size: 10))
                                                .foregroundColor(.white)
                                                .padding(.top, 10)
                                                .padding(.leading, 10)
                                        }
                                    
                                    Text(card.name)
                                        .font(Font.Inter.medium(size: 16))
                                        .foregroundColor(Color.Style.blackText)

                                    Spacer(minLength: 0)
                                    
                                    Image("Chevron")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 32,height: 32)
                                        .foregroundColor(.black)
                                    
                                    
                                }
                                .frame(height: 64)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                    .padding(.top, 8)
                    
                    Spacer(minLength: 0)
                }
            }
    }
    
    @ViewBuilder func recentTransactions() -> some View {
        VStack {
            HStack(spacing: 0) {
                Text("Recent transactions")
                    .font(Font.Inter.semiBold(size: 16))
                    .padding(.top, 16)
                    .foregroundColor(Color.Style.blackText)
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Text("See all")
                        .font(Font.Inter.medium(size: 14))
                        .underline()
                        .foregroundColor(.black)
                        .padding(.top, 19)
                        .foregroundColor(Color.Style.blackText)
                }
            }
            .padding(.horizontal, 16)
            
            ScrollView {
                ForEach(vm.recentTransaction) { transaction in
                    HStack(spacing: 0) {
                        
                        Circle()
                            .foregroundColor(Color(hex: "F6F7F9"))
                            .frame(width: 40, height: 40)
                            .overlay {
                                Image(transaction.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 21, height: 21)
                                
                            }
                            .padding(.horizontal, 16)
                        
                        
                        VStack(alignment: .leading) {
                            Text(transaction.company)
                                .font(Font.Inter.medium(size: 16))
                                .foregroundColor(Color.Style.blackText)
                                .padding(.trailing, 12)
                            
                            Text(hiddenCardNumber(cardNumber: transaction.number))
                                .font(Font.Inter.medium(size: 16))
                                .foregroundColor(Color(hex: "7E8493"))
                        }
                        
                        Spacer(minLength: 0)
                        
                        Text("\(transaction.amount.formatted(.currency(code: transaction.currency)))")
                            .strikethrough(transaction.status == .declined , color: amountColor(transaction))
                            .font(Font.Inter.medium(size: 16))
                            .foregroundColor(amountColor(transaction))
                        
                        Image(transaction.receipt == true ? "GoodReceipt" : "BadReceipt")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .padding(.horizontal, 16)
                            .opacity(transaction.status == .declined ? 0 : 1)
                    }
                    .frame(height: 64)
                }
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        
    }
}

// MARK: Functions
private extension HomeView {
    
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
