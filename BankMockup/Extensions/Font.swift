//
//  Font.swift
//  BankMockup
//
//  Created by Danylo Malovichko on 19.10.2023.
//

import SwiftUI

extension Font {
    
    struct Inter {
        static func regular(size: CGFloat) -> Font {
            .custom("Inter-Regular", size: size)
        }
        
        static func medium(size: CGFloat) -> Font {
            .custom("Inter-Medium", size: size)
        }
        
        static func semiBold(size: CGFloat) -> Font {
            .custom("Inter-SemiBold", size: size)
        }
        
        static func extraBold(size: CGFloat) -> Font {
            .custom("Inter-ExtraBold", size: size)
        }
    }
}
