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
    
    static let firstColor = Color.rgb(r: 216, g: 105, b: 62)
    static let secondColor = Color.rgb(r: 201, g: 60, b: 70)
    
}
