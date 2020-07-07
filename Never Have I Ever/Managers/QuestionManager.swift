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
    @Published var dareArray: [String] = ["Give a piggy back for 10 seconds to the youngest in the room", "Sing a song of someone else's choosing out loud", "Dance to a song of someone else's choosing", "Do ten push-ups", "Scream as loud as you can", "Pretend to be the opposite gender until it's your turn again", "Eat a mixture of four random ingredients picked by someone else in the room", "Lick someone else's shoe", "Chug a whole bottle of water", "Let another player sit on your lap until it's your turn again", "Smell someone else's socks for 5 seconds", "Keep your eyes closed until it's your turn again"]
    @Published var dare: String = ""
    @Published var firstColor: Color = Color.normFirstColor
    @Published var secondColor: Color = Color.normSecondColor
}

