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
                    
                    NostalgicView(showing: $showing)
                    
                }
                
                
               
                
                Spacer(minLength: 0)
            }
            
        }
            
            
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct NormalView: View {
   let questionArray = ["If you have sang in the shower", "If you have removed your wisdom teeth", "If you have copied someone's assignment", "If you have driven a car", "If you have farted in class", "If you have held in pee to not miss the movie", "If you have adjusted your face when the opposite gender walks by", "If you have been embarassed when going to the mall with your family", "If you have spent money on something useless", "If you have been caught staring at a girl's butt", "If you have lied to a teacher", "If you have stalled time in class by talking to a teacher", "If you have ever ended up being on your phone way longer than expected", "If you have kissed someone", "If you have been in a fight", "If you have keyed a car", "If you have cheated on a test", "If you have lied to a teacher", "If you have had a pet", "If you have called the police", "If you have cried for no reason", "If you have been cheated on", "If you have snuck out of the house", "If you have been attacked by a dog", "If you have worn someone else's clothes", "If you have lied for someone else's sake", "If you have shaved your legs", "If you have kissed someone random", "If you have traveled outside of the country", "If you have a passport", "If you have been skiing", "If you have sent a message to the wrong person", "If you have accidentally liked someone's Instagram post", "If you have accidentally posted something random", "If you have met a celebrity", "If you have snuck out of the house", "If you have gotten surgery", "If you have been called a nickname", "If you have never read Harry Potter", "If you have been wakeboarding or water skiing", "If you have lost your phone", "If you have played the piano at a party", "If you have paid for someone else's food", "If you have stolen from a store", "If you have slept in class", "If you have ignored someone for a day", "If you have forged your parent's signature", "If you have pulled an all nighter", "If you have ran a marathon", "If you have eaten at a restaurant over 60 dollars per person", "If you have been to Disney World", "If a celebrity has ever DM'ed you", "If you have slept over your alarm", "If you have gotten into a car crash", "If you have been pulled over by the police", "If you have been drug tested", "If you have ever asked someone on a date", "If you ever have been asked on a date", "If you have ditched school in the middle of the day", "If you have broken your phone", "If you have been driven somewhere while sitting in the trunk", "If you have been to a football game", "If you have watched an NBA game in person", "If you have watched an NFL game in person", "If you have tripped and fell in the school hallway", "If you have ever failed a test", "If you have worked ever somewhere", "If you have gotten a flat tire", "If you have gone to summer school", "If you have gone viral on TikTok", "If you have gotten a tattoo", "If you have ghosted someone through texts", "If you have been embarrassed in front of your crush", "If you have had a crush on your teacher", "If you have had a crush on someone's girlfriend or boyfriend", "If you have punched someone before", "If you have owned a Gameboy", "If you have ever worn pants in public without underwear", "If you have ever been in public without a bra", "If you have ever guessed someone's password correctly", "If you have ever snooped through someone's phone"]
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
                //82
        }
    }
    
}

struct SportsView: View {
    let questionArray = ["If you have ran a marathon before", "If you have completed a Murph", "If you have ever played more than 3 sports", "If you have ran a 5K before", "If you have taken supplements",  "If you have ever dunked on somebody", "If you have ever woken up before 6 in the morning to workout", "If you have ever swam more than 2 miles at once", "If you have ever biked more than 50 miles at once", "If you have ever completed more than 10 pull ups at once", "If you have ever completed more than 50 push ups at once", "If you have scored more than 30 points in a basketball game", "If you have skipped repetitions during a practice", "If you can do the splits", "If you have ever ran 100 meters in under 12 seconds", "If you have ever had a vertical of more than 30 inches", "If you have ever slept over a practice", "If you have ever nutmegged someone in soccer", "If you have ever crossed someone up in basketball", "If you have ever felt dizzy in the gym after lifting", "If you have ever kicked a field goal further than 25 yards", "If you have ever thrown up during a practice", "If you have ever benched at least 225 pounds", "If you have ever swam 50 yards in less than 30 seconds", "If you have ever took a nap after a hard workout", "If you have ever played better during a game when the other gender is watching", "If you have ever won a sports tournament", "If you have ever received a college sports offer", "If you have ever been punished during a sports practice", "If you have ever made a joke when doing conditioning", "If you have ever done suicides", "If you have ever made up an excuse for skipping practice", "If you have ever been kicked out of a practice"]
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
                //33
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

struct NostalgicView : View {
    let questionArray = ["Hello"]
    @EnvironmentObject var questionManager: QuestionManager
    @Binding var showing: Bool
    var body: some View {
        Image("nostalgiccrop")
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
