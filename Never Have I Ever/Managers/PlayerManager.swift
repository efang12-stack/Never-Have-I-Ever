//
//  PlayerManager.swift
//  Never Have I Ever
//
//  Created by Ethan on 6/13/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import Foundation
import SwiftUI

class PlayerManager: ObservableObject {
    @Published var numberOfPlayers = 0
    @Published var index = 0
    @Published var playerNameArray = ["", "", "", "", "", "", "", ""]
}
