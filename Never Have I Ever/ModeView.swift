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
   let questionArray = ["If you have ever sang in the shower", "If you have removed your wisdom teeth", "If you have ever copied someone's assignment", "If you have ever driven a car", "If you have ever farted in class", "If you have ever held in pee to not miss the movie", "If you have ever adjusted your hair when the opposite gender walks by", "If you have ever been embarassed when going to the mall with your family", "If you have ever spent money on something useless", "If you have ever been caught staring at a girl's butt", "If you have ever lied to a teacher", "If you have ever stalled time in class by talking to a teacher", "If you have ever kissed someone", "If you have ever been in a fight", "If you have ever keyed a car", "If you have ever cheated on a test",  "If you have ever had a pet", "If you have ever called the police", "If you have ever cried for no reason", "If you have ever been cheated on", "If you have ever snuck out of the house", "If you have ever been attacked by a dog", "If you have ever worn someone else's clothes", "If you have ever lied for someone else's sake", "If you have ever shaved your legs", "If you have ever kissed someone random", "If you have ever traveled outside of the country", "If you have a passport", "If you have ever been skiing", "If you have ever sent a message to the wrong person", "If you have ever accidentally liked someone's Instagram post", "If you have ever accidentally posted something embarrassing on social media", "If you have ever met a celebrity", "If you have ever snuck out of the house", "If you have ever gotten surgery", "If you have ever been called a nickname", "If you have never read Harry Potter", "If you have ever been wakeboarding or water skiing", "If you have ever lost your phone", "If you have ever played the piano at a party", "If you have ever paid for someone else's food", "If you have ever stolen from a store", "If you have ever slept in class", "If you have ever ignored someone for a day", "If you have ever forged your parent's signature", "If you have ever pulled an all nighter", "If you have ever ran a marathon", "If you have ever eaten at a restaurant for over 60 dollars per person", "If you have ever been to Disney World", "If a celebrity has ever DM'ed you", "If you have ever slept over your alarm", "If you have ever gotten into a car crash", "If you have ever been pulled over by the police", "If you have ever been drug tested", "If you have ever asked someone on a date", "If you have ever been asked on a date", "If you have ever ditched school in the middle of the day", "If you have ever broken your phone", "If you have ever been driven somewhere while sitting in the trunk", "If you have ever been to a football game", "If you have ever watched an NBA game in person", "If you have ever watched an NFL game in person", "If you have ever tripped and fell in the school hallway", "If you have ever failed a test", "If you have ever worked somewhere", "If you have ever gotten a flat tire", "If you have ever gone to summer school", "If you have ever gone viral on TikTok", "If you have ever gotten a tattoo", "If you have ever ghosted someone through texts", "If you have ever been embarrassed in front of your crush", "If you have ever had a crush on your teacher", "If you have ever had a crush on someone's girlfriend or boyfriend", "If you have ever punched someone before", "If you have ever owned a Gameboy", "If you have ever worn pants in public without underwear", "If you have ever been in public without a bra", "If you have ever guessed someone's password correctly", "If you have ever snooped through someone's phone", "If you have ever prank called someone", "If you have ever lied to your parents", "If you have ever learned an instrument", "If you have ever talked back to a teacher", "If you have ever finessed one of your friend's belongings", "If you have ever missed your flight", "If you have ever whipped someone with a towel", "If you have ever seen one of your friends naked", "If you have ever mixed random condiments into a drink", "If you have ever not payed for your food", "If you have ever raced someone while driving on the road", "If you have ever lost your earbuds", "If you have ever accused someone else for something that you did",  "If you have ever cheated on someone", "If you have ever rejected someone", "If you have ever taken pictures of yourself on your friend's phone", "If you have ever written things in a diary", "If you have ever snuck into a movie theater", "If you have ever been dared to ask someone out", "If you have ever been on a talent show", "If you have ever cried over a bad grade", "If you have ever pulled an all nighter just to study for a test", "If you have ever decided to not study because you knew you were going to fail", "If you have ever made a Youtube video", "If you have ever streamed video games online", "If you have ever worn makeup", "If you have ever told someone that you didn't want to be friends anymore", "If you have ever Googled how to be hotter", "If you have ever Googled how to get a girlfriend or boyfriend", "If you have ever written a song", "If you have ever had a leadership position in a club", "If you have ever used VSCO", "If you have ever been left out when your friends make plans", "If you have ever fake texted to not appear lonely"]
    @EnvironmentObject var questionManager: QuestionManager
    @Binding var showing: Bool
    var body: some View{
        Image("Norm")
            .resizable()
            .frame(width:UIScreen.main.bounds.width / 1.2 ,height: UIScreen.main.bounds.height / 5.9)
            .cornerRadius(17)
            .padding()
            .shadow(color: .black, radius: 2, x: 0, y: 0)
            .onTapGesture {
                self.showing.toggle()
                self.questionManager.chosenArray = self.questionArray
                print(self.questionArray.count)
        }
    }
    
}

struct SportsView: View {
    let questionArray = ["If you have ever ran a marathon before", "If you have ever completed a Murph", "If you have ever played more than 3 sports", "If you have ever ran a 5K before", "If you have ever taken supplements",  "If you have ever dunked on somebody", "If you have ever woken up before 6 in the morning to workout", "If you have ever swam more than 2 miles at once", "If you have ever biked more than 50 miles at once", "If you have ever completed more than 10 pull ups at once", "If you have ever completed more than 50 push ups at once", "If you have scored more than 30 points in a basketball game", "If you have skipped repetitions during a practice", "If you can do the splits", "If you have ever ran 100 meters in under 12 seconds", "If you have ever had a vertical of more than 30 inches", "If you have ever slept over a practice", "If you have ever nutmegged someone in soccer", "If you have ever crossed someone up in basketball", "If you have ever felt dizzy in the gym after lifting", "If you have ever kicked a field goal further than 25 yards", "If you have ever thrown up during a practice", "If you have ever benched at least 225 pounds", "If you have ever swam 50 yards in less than 30 seconds", "If you have ever took a nap after a hard workout", "If you have ever played better during a game when the other gender is watching", "If you have ever won a sports tournament", "If you have ever received a college sports offer", "If you have ever been punished during a sports practice", "If you have ever made a joke when doing conditioning", "If you have ever done suicides", "If you have ever made up an excuse for skipping practice", "If you have ever been kicked out of a practice", "If you have ever Googled how to get bigger muscles", "If you have ever had a six pack"]
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
    let questionArray = ["If you have ever taken a dump without wiping", "If you have ever had a friend with benefits", "If you have ever had sex in a car", "If you have ever had sex on the first date"]
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
    let questionArray = ["If you have ever owned a Gameboy", "If you have ever watched Cartoon Network", "If you have ever watched Nickelodeon", "If you have ever used a scooter board in elementary school", "If you have ever listened to Hey There Delilah", "If you have ever played Club Penguin", "If you have ever owned a Wii", "If you have ever owned SillyBandz", "If you have ever owned BeyBlades", "If you have ever played with Bakugans", "If you ever played with Pokémon cards", "If you ever made a Rainbowloom", "If you have ever owned a PSP", "If you have ever played Poptropica", "If you have ever eaten Lunchables", "If you have ever played the Concentration Handclap game", "If you have ever eaten Dunkaroos", "If you have ever played Super Mario Galaxy", "If you have ever owned an XBox 360", "If you have ever owned a PlayStation 3", "If you have ever watched Spongebob", "If you have ever watched the Simpsons", "If you have ever watched the Teletubbies", "If you have ever completed the multiplication tables in elementary school", "If you have ever learned cursive in elementary school", "If you have ever bought a poster at the Scholastic bookfair", "If you have ever bought a book at the Scholastic bookfair", "If you have ever bought Invisible Ink at the bookfair", "If you have ever drawn the cartoon \"S\" in school because you were bored", "If you have ever gone under the parachute in elementary school", "If you have ever typed 5319009 on a calculator", "If you have ever collected Box Tops at school", "If you have ever done a fake mechanical pencil shot", "If you have ever had to take Flintstone vitamin gummies", "If you have ever bought a Lego set", "If you have ever tried to make a ball using Play-Doh", "If you have ever watched The Suite Life of Zack & Cody", "If you have ever played Minecraft with your friends", "If you have ever owned a Nintendo DS", "If you have ever watched Bill Nye videos in class", "If you have ever watched The Magic School Bus in class", "If you have ever watched Kenny the Shark", "If you have ever watched Dragon Tales"]
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
                    print(self.questionArray.count)
               }
    }
}


struct ModeView_Previews: PreviewProvider {
    static var previews: some View {
        ModeView(show: .constant(false)).environmentObject(PlayerManager())
    }
}
