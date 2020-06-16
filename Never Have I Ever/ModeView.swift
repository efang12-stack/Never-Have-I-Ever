//
//  ModeView.swift
//  Never Have I Ever
//
//  Created by Ethan on 6/14/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import SwiftUI

struct ModeView: View {
    @EnvironmentObject var playerManager: PlayerManager
    var body: some View {
        ZStack{
            Image("background")
            .resizable()
            .edgesIgnoringSafeArea(.all)
        }
            .navigationBarTitle("Game Mode", displayMode: .inline)
    }
}

struct ModeView_Previews: PreviewProvider {
    static var previews: some View {
        ModeView().environmentObject(PlayerManager())
    }
}
