//
//  ModeView.swift
//  Never Have I Ever
//
//  Created by Ethan on 6/14/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import SwiftUI

struct ModeView: View {
    @Binding var show: Bool
    @EnvironmentObject var playerManager: PlayerManager
    @EnvironmentObject var questionManager: QuestionManager
    @State var showing: Bool = false
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            NavigationLink(destination: NormalModeView(), isActive: self.$showing) {
                Text("")
            }
            VStack(spacing: 0){
                
                HStack(spacing: UIScreen.main.bounds.width / 3) {
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    
                    Text("Mode")
                        .foregroundColor(.white)
                        .font(.custom("Hiragino Sans", size: 25)).bold()
                        .frame( alignment: .center)
                    
                    Spacer(minLength: 0)
                }
                    
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
                .padding([.horizontal, .bottom])
                
                VStack(spacing: -16){
                    
                    NormalView(showing: $showing)
                    
                    SportsView(showing: $showing)
                    
                   DareView(showing: $showing)
                    
                }
                
                Spacer(minLength: 30)
                Text("More Modes Coming Soon...")
                    .font(.custom("Hiragino Sans", size: 24))
                    .bold()
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
            }
            
        }
            
            
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct NormalView: View {
   let questionArray = ["If you have sang in the shower", "If you have removed your wisdom teeth", "If you have copied someone's assignment", "If you have driven a car", "If you have farted in class", "If you have held in pee to not miss the movie", "If you have adjusted your face when the opposite gender walks by", "If you have been embarassed when going to the mall with your family", "If you have spent money on something useless", "If you have been caught staring at a girl's butt", "If you lied to a teacher", "If you stalled time in class by talking to a teacher", "If you told yourself to be on your phone for just another minute but it ended up being way longer", "If you have kissed someone", "If you have been in a fight", "If you have keyed a car", "If you have cheated on a test", "If you have lied to a teacher", "If you have had a pet", "If you have called the police", "If you have cried for no reason", "If you have been cheated on", "If you have snuck out of the house", "If you have been attacked by a dog", "If you have worn someone else's clothes", "If you have lied for someone else's sake", "If you have shaved your legs", "If you have kissed someone random", "If you have traveled outside of the country", "If you have a passport", "If you have been skiing", "If you have sent a message to the wrong person", "If you have accidentally liked someone's Instagram post", "If you have accidentally posted something random", "If you have met a celebrity", "If you have snuck out of the house", "If you have gotten surgery", "If you have been called a nickname", "If you have never read Harry Potter", "If you have been wakeboarding or water skiing", "If you have lost your phone", "If you have played the piano at a party", "If you have paid for someone else's food", "If you have stolen a pencil", "If you have slept in class", "If you have ignored someone for a day", "If you have forged your parent's signature", "If you have pulled an all nighter", "If you have ran a marathon", "If you have eaten at a restaurant over 60 dollars per person", "If you have been to Disney World", "If a celebrity has DM'ed you", "If you have slept over your alarm", "If you have gotten into a car crash", "If you have been pulled over by the police", "If you have been drug tested", "If you have asked someone on a date", "If you have been asked on a date", "If you have ditched school in the middle of the day", "If you have broken your phone", "If you have been driven somewhere while sitting in the trunk", "If you have been to a football game", "If you have watched an NBA game in person", "If you have watched an NFL game in person", "If you have tripped and fell in the school hallway", "If you have failed a test", "If you have worked somehwere", "If you have gotten a flat tire", "If you have gone to summer school", "If you have gone viral on TikTok", "If you "]
    @EnvironmentObject var questionManager: QuestionManager
    @Binding var showing: Bool
    var body: some View{
        Image("normcrop")
            .resizable()
            .frame(width:UIScreen.main.bounds.width / 1.2 ,height: UIScreen.main.bounds.height / 5.9)
            .cornerRadius(17)
            .padding()
            .shadow(color: .black, radius: 2, x: 0, y: 0)
            .onTapGesture {
                self.showing.toggle()
                self.questionManager.chosenArray = self.questionArray
        }
    }
    
}

struct SportsView: View {
    let questionArray = ["Hi"]
    @EnvironmentObject var questionManager: QuestionManager
    @Binding var showing: Bool
    var body: some View{
        Image("sportscrop")
            .resizable()
            .frame(width:UIScreen.main.bounds.width / 1.2 ,height: UIScreen.main.bounds.height / 5.9)
            .cornerRadius(17)
            .padding()
            .shadow(color: .black, radius: 2, x: 0, y: 0)
            .onTapGesture {
                self.showing.toggle()
                self.questionManager.chosenArray = self.questionArray
        }
    }
}

struct DareView: View {
    let questionArray = ["Hello"]
    @EnvironmentObject var questionManager: QuestionManager
    @Binding var showing: Bool
    var body: some View{
        Image("darecrop")
            .resizable()
            .frame(width:UIScreen.main.bounds.width / 1.2 ,height: UIScreen.main.bounds.height / 5.9)
            .cornerRadius(17)
            .padding()
            .shadow(color: .black, radius: 2, x: 0, y: 0)
            .onTapGesture {
                self.showing.toggle()
                 self.questionManager.chosenArray = self.questionArray
        }
        
    }
}


struct ModeView_Previews: PreviewProvider {
    static var previews: some View {
        ModeView(show: .constant(false)).environmentObject(PlayerManager())
    }
}
