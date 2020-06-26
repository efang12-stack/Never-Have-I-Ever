//
//  Colors.swift
//  Never Have I Ever
//
//  Created by Ethan on 6/20/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    
    static let normFirstColor = Color.rgb(r: 216, g: 105, b: 62)
    static let normSecondColor = Color.rgb(r: 201, g: 60, b: 70)
    static let nostalgicFirstColor = Color.rgb(r: 21, g: 220, b: 240)
    static let nostalgicSecondColor = Color.rgb(r: 236, g: 127, b: 238)
    
//    static let dareFirstColor = Color.rgb(r: 140, g: 14, b: 198)
//    static let dareSecondColor = Color.rgb(r: 17, g: 23, b: 140)
    
    static let dareFirstColor = Color.rgb(r: 150, g: 15, b: 30)
    static let dareSecondColor = Color.rgb(r: 24, g: 93, b: 39)
    
}
