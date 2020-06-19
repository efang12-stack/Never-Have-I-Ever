//
//  NormalModeView.swift
//  Never Have I Ever
//
//  Created by Ethan on 6/17/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import SwiftUI

struct NormalModeView: View {
    @EnvironmentObject var questionManager: QuestionManager
    var body: some View {
        Text(questionManager.chosenArray[2])
    }
}

struct NormalModeView_Previews: PreviewProvider {
    static var previews: some View {
        NormalModeView()
    }
}
