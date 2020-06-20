//
//  NormalModeView.swift
//  Never Have I Ever
//
//  Created by Ethan on 6/17/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import SwiftUI

struct NormalModeView: View {
   @State var questionDisplay = "Round 1"
    @State var animations : [Bool] = [false]
    @State var changeText: Bool = false
    @State var sizeText: Int = 58
    @EnvironmentObject var questionManager: QuestionManager
    var body: some View {
        ZStack{
            Image("background")
            .onTapGesture {
                if self.changeText == false{
                    self.sizeText = 18
                }
                self.questionDisplay = self.questionManager.chosenArray[Int.random(in: 0...self.questionManager.chosenArray.count-1)]
            }

            
        Text(questionDisplay)
            .font(.custom("Verdana Bold", size: CGFloat(sizeText)))
            .foregroundColor(.white)
        .shadow(radius: 20)
            .offset(x: self.animations[0] ? 0 : -1500, y: 0)
            .onAppear {
                withAnimation(Animation.easeIn.speed(0.3)) {
                    self.animations[0].toggle()

                }
                
            }
        }
    }
}

struct NormalModeView_Previews: PreviewProvider {
    static var previews: some View {
        NormalModeView()
    }
}
