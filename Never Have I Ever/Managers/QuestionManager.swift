//
//  QuestionManager.swift
//  Never Have I Ever
//
//  Created by Ethan on 6/18/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import Foundation
import SwiftUI

class QuestionManager: ObservableObject {
    @Published var chosenArray: [String] = ["", ""]
    @Published var dare: String = ""
}

