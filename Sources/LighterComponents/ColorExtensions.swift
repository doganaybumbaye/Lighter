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
    static let lighterPrimaryColor = Color(red: 48/255, green: 92/255, blue: 210/255) // Gökyüzü Mavisi
    static let lighterSecondaryColor = Color(red: 240/255, green: 120/255, blue: 34/255) // Altın Turuncusu
    static let lighterBackgroundColor = Color(red: 250/255, green: 248/255, blue: 239/255) // Şeftali Beyazı
    static let lighterTextColor = Color(red: 49/255, green: 52/255, blue: 67/255) // Orman Yeşili
    static let lighterAccentColor = Color(red: 220/255, green: 12/255, blue: 12/255) // Mor Pembe

    static let lightercomplementaryColor1 = Color(red: 38/255, green: 167/255, blue: 139/255) // Deniz Yeşili
    static let lightercomplementaryColor2 = Color(red: 191/255, green: 22/255, blue: 131/255) // Somon Pembe
    static let lighterFancyGray = Color(red: 150/255, green: 150/255, blue: 150/255) // Fancy Gri Renk
    static let lighterOffWhiteColor = Color(red: 245/255, green: 245/255, blue: 245/255)
    static let lighterBrightOffWhiteColor = Color(red: 255/255, green: 250/255, blue: 250/255)

    static let lighterWhiteGradient = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color(white: 0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
}

