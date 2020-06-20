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
    @State var animations = false
    @State var changeText: Bool = false
    @State var sizeText: Int = 58
    @EnvironmentObject var questionManager: QuestionManager
    var body: some View {
        ZStack{
            Color.blue
                .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                if self.changeText == false{
                    self.sizeText = 18
                }
                self.questionDisplay = self.questionManager.chosenArray[Int.random(in: 0...self.questionManager.chosenArray.count-1)]
            }

            VStack{
        Text(questionDisplay)
            .onTapGesture {
                if self.changeText == false{
                    self.sizeText = 18
                }
                self.questionDisplay = self.questionManager.chosenArray[Int.random(in: 0...self.questionManager.chosenArray.count-1)]
            }
            .multilineTextAlignment(.center)
            .font(.custom("Verdana Bold", size: CGFloat(sizeText)))
            .foregroundColor(.white)
        .shadow(radius: 20)
            .offset(x: self.animations ? 0 : -1500, y: 0)
            .onAppear {
                withAnimation(Animation.easeIn.speed(0.3)) {
                    self.animations.toggle()

                }
                
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
