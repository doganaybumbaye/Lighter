//
//  File.swift
//  
//
//  Created by Doğanay Şahin on 18.06.2023.
//

import Foundation
import SwiftUI
import UIKit

public extension Color {

    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
    // MARK: - Colors
    static let lighterPrimary = Color(hex: 3955706)
    static let lighterSecondary = Color(hex: 1447446)
    static let lighterError = Color(hex: 16399466)
    static let lighterSuccess = Color(hex: 47752)
    static let lighterDisabled = Color(hex: 14277081)
    static let lighterText = Color(hex: 1447446)
    static let lighterSubtext = Color(hex: 11974326)
    static let lighterNight = Color(hex: 1447446)
    
    static let lighterGrey = Color(hex: 11974326)
    static let lighterOffWhite = Color(hex: 16119285)
    
}

