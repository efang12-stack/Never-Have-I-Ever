//
//  NormalModeView.swift
//  Never Have I Ever
//
//  Created by Ethan on 6/17/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import SwiftUI
import StoreKit

struct NormalModeView: View {
    @State var questionDisplay = "Round 1"
    @State var actionDisplay = "Take a dare from someone"
    @State var nameChooser = ""
    @State var font: String = "Verdana Bold"
    @State var counter = 0
    @State var sizeText: Int = 58
    @State var arrayCount: Int = 0
    @State var playerNameArrayCount = 0
    @State var animations = false
    @State var showText = false
    @State var showLastPick = false
    @State var showButton = false
    @State var showAlert: Bool = false
    @State var showDare = false
    @State var turnVisible = false
    @Binding var show: Bool
    @EnvironmentObject var questionManager: QuestionManager
    @EnvironmentObject var playerManager: PlayerManager
    
    var body: some View {
        
    ZStack{
            LinearGradient(gradient: Gradient(colors: [questionManager.firstColor, questionManager.secondColor]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                if self.counter == 8 {
                  
                    self.sizeText = 58
                    self.font = "Verdana Bold"
                    self.questionDisplay = "Round 2"
                    self.counter+=1
                }
                else if self.counter == 17 {
                    self.sizeText = 58
                    self.font = "Verdana Bold"
                    self.questionDisplay = "Last Round"
                    self.counter+=1
                }
                else if self.counter == 21{
                    self.sizeText = 58
                    self.font = "Verdana Bold"
                    self.questionDisplay = "Finished!"
                    self.counter+=1
                    
                    SKStoreReviewController.requestReview()
                }
                else if self.counter > 21 {
                    self.sizeText = 58
                    self.font = "Verdana Bold"
                    self.questionDisplay = "Finished!"
                    self.counter+=1
                    
                    
                }
                else{
                self.counter+=1
                    self.sizeText = 18
                    self.font = "Verdana"
                    if self.counter < 23 {
                self.questionDisplay = self.questionManager.chosenArray[Int.random(in: 0...self.questionManager.chosenArray.count-1)]
                        
                           

                    }
                }
                    
                    if self.counter == 1 || self.counter == 9 || self.counter == 10 || self.counter == 18 {
                        self.turnVisible.toggle()
                    }
                
                    if self.counter == 1 || self.counter == 9 || self.counter == 10  ||  self.counter == 22 {
                    self.showText.toggle()
                }
                    
                    if self.counter == 1 || self.counter == 9 || self.counter == 10 || self.counter == 18 || self.counter == 19 || self.counter == 22 {
                        self.showDare.toggle()
                    }
                
                if self.counter == 9 {
                    self.actionDisplay = "Give a dare to someone"
                }
                if self.counter == 18 {
                    self.actionDisplay = "Get Ready!"
                }
                if self.counter == 19 {
                   self.actionDisplay = "Give two dares to one person of your choice"
                    self.showLastPick.toggle()
                    self.showButton.toggle()

                }
                if self.counter == 20 {
                    self.actionDisplay = "Give half of the people in the room a dare"
                    
                    self.nameChooser = ""
                }
                if self.counter == 21 {
                   self.actionDisplay = "Give everyone a dare"
                   
                    self.nameChooser = ""
                }
                if self.counter == 22 {
                    self.showButton.toggle()
                    self.showLastPick.toggle()
                }
                    
               //Name picking
                    if self.counter != 1 && self.counter != 10 {
                        if self.arrayCount < self.playerNameArrayCount - 1 {
                            self.arrayCount+=1
                        }else{
                            self.arrayCount = 0
                        }
                    }
                    
                                
            }
            
                //X Button
                    VStack{
                    
                        HStack{
                    
                            Spacer()
                    
                                Button(action: {
                                    self.show.toggle()
                                }) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .font(.custom("Verdana Bold", size: 33))
                                }
                                .padding([.top, .trailing], 20)
                
                        }
                    
                    Spacer()
                }
        
                //Turn
                    VStack{
                                Text("Your Turn:")
                                    .foregroundColor(.white)
                                    .font(.custom("Verdana", size: 20))
                                    .padding(.bottom, 10)
                                    .opacity(turnVisible ? 1 : 0)
                                Text(playerManager.playerNameArray[arrayCount])
                                    .foregroundColor(.white)
                                    .font(.custom("Verdana Bold", size: 25))
                                    .opacity(turnVisible ? 1 : 0)
                                Spacer()
                        }
                    .padding(.top, 20)
        
                //Pick a name
                      VStack{
                                  
                                  Text("Pick a name:")
                                  .opacity(showLastPick ? 1 : 0)
                                  .foregroundColor(.white)
                                  .font(.custom("Verdana", size: 20))
                                      .padding(.bottom)

                                      
                                  Text(nameChooser)
                                      .foregroundColor(.white)
                                      .font(.custom("Verdana Bold", size: 25))
                                      .padding(.bottom, 40)
                                      .opacity(showLastPick ? 1 : 0)
                                  

                                  Button(action: {
                                          var player = self.playerManager.playerNameArray.randomElement()
                                          while player == "" {
                                          player = self.playerManager.playerNameArray.randomElement()
                                          }
                                          self.nameChooser = player!
                                      
                                  }) {
                                          Text("Pick")
                                              .foregroundColor(questionManager.secondColor)
                                              .font(.system(size: 20))
                                  }
                                  .padding(.all, 10)
                                  .padding([.leading, .trailing], 20)
                                  .background(Color.white)
                                  .cornerRadius(10)
                                  .shadow(color: .black, radius: 1, x: 0, y: 0)
                                  .opacity(showButton ? 1 : 0)
                  
                                      Spacer()
                                  
                              }
                      .padding(.top, 20)

                
                //Question and action
                    VStack(spacing: 30){
                            
                            Text(questionDisplay)
                                .onTapGesture {
                                    if self.counter == 8 {
                                      
                                        self.sizeText = 58
                                        self.font = "Verdana Bold"
                                        self.questionDisplay = "Round 2"
                                        self.counter+=1
                                    }
                                    else if self.counter == 17 {
                                        self.sizeText = 58
                                        self.font = "Verdana Bold"
                                        self.questionDisplay = "Last Round"
                                        self.counter+=1
                                    }
                                    else if self.counter == 21{
                                        self.sizeText = 58
                                        self.font = "Verdana Bold"
                                        self.questionDisplay = "Finished!"
                                        self.counter+=1
                                        
                                        SKStoreReviewController.requestReview()

                                    }
                                    else if self.counter > 21 {
                                        self.sizeText = 58
                                        self.font = "Verdana Bold"
                                        self.questionDisplay = "Finished!"
                                        self.counter+=1
                                    }
                                    else{
                                    self.counter+=1
                                        self.sizeText = 18
                                        self.font = "Verdana"
                                        if self.counter < 23 {
                                    self.questionDisplay = self.questionManager.chosenArray[Int.random(in: 0...self.questionManager.chosenArray.count-1)]
                                        

                                        }
                                    }
                                    
                                    if self.counter == 1 || self.counter == 9 || self.counter == 10 || self.counter == 18 {
                                        self.turnVisible.toggle()
                                    }
                                    
                                    if self.counter == 1 || self.counter == 9 || self.counter == 10  || self.counter == 22 {
                                        self.showText.toggle()
                                    }
                                    
                                    if self.counter == 1 || self.counter == 9 || self.counter == 10 || self.counter == 18 || self.counter == 19 || self.counter == 22 {
                                        self.showDare.toggle()
                                    }
                                    
                                    if self.counter == 9 {
                                        self.actionDisplay = "Give a dare to someone"
                                    }
                                    if self.counter == 18 {
                                        self.actionDisplay = "Get Ready!"
                                    }
                                    if self.counter == 19 {
                                       self.actionDisplay = "Give two dares to one person of your choice"
                                        self.showLastPick.toggle()
                                        self.showButton.toggle()

                                    }
                                    if self.counter == 20 {
                                        self.actionDisplay = "Give half of the people in the room a dare"
                                        
                                        self.nameChooser = ""
                                    }
                                    if self.counter == 21 {
                                       self.actionDisplay = "Give everyone a dare"
                                       
                                        self.nameChooser = ""
                                    }
                                    if self.counter == 22 {
                                        self.showButton.toggle()
                                        self.showLastPick.toggle()
                                    }
                                    
                                    if self.counter != 1 && self.counter != 10 {
                                        if self.arrayCount < self.playerNameArrayCount - 1 {
                                            self.arrayCount+=1
                                        }else{
                                            self.arrayCount = 0
                                        }
                                    }
                                                    
                                }
                                .multilineTextAlignment(.center)
                                .frame(width: UIScreen.main.bounds.width / 1.2 )
                                .font(.custom(font, size: CGFloat(sizeText)))
                                .foregroundColor(.white)
                                .shadow(radius: 15)
                                .offset(x: self.animations ? 0 : -1500, y: 0)
                                .alert(isPresented: $showAlert) {
                                    Alert(title: Text("Warning"), message: Text("This mode is for teens 17 years of age or older. By continuing, you agree that you are at least 17 years of age."), dismissButton: .default(Text("Ok"))
                        
                        
                                    )
                                    }
                                    .onAppear {
                            
                                        withAnimation(Animation.easeIn.speed(0.3)) {
                                            self.animations.toggle()
                        
                                        }

                                    }
        //            .padding(.bottom, 30)

                        
                        Text(actionDisplay)
                            .multilineTextAlignment(.center)
                            .frame(width: UIScreen.main.bounds.width / 1.2 )
                            .foregroundColor(.white)
                            .font(.custom("Verdana Bold", size: 20))
                            .opacity(showText ? 1 : 0)
                            .onTapGesture {
                                if self.counter == 8 {
                                  
                                    self.sizeText = 58
                                    self.font = "Verdana Bold"
                                    self.questionDisplay = "Round 2"
                                    self.counter+=1
                                }
                                else if self.counter == 17 {
                                    self.sizeText = 58
                                    self.font = "Verdana Bold"
                                    self.questionDisplay = "Last Round"
                                    self.counter+=1
                                }
                                else if self.counter == 21{
                                    self.sizeText = 58
                                    self.font = "Verdana Bold"
                                    self.questionDisplay = "Finished!"
                                    self.counter+=1
                                    
                                    SKStoreReviewController.requestReview()

                                }
                                else if self.counter > 21 {
                                    self.sizeText = 58
                                    self.font = "Verdana Bold"
                                    self.questionDisplay = "Finished!"
                                    self.counter+=1
                                }
                                else{
                                self.counter+=1
                                    self.sizeText = 18
                                    self.font = "Verdana"
                                    if self.counter < 23 {
                                self.questionDisplay = self.questionManager.chosenArray[Int.random(in: 0...self.questionManager.chosenArray.count-1)]

                                    }
                                }
                                
                                if self.counter == 1 || self.counter == 9 || self.counter == 10 || self.counter == 18 {
                                    self.turnVisible.toggle()
                                }
                                
                                if self.counter == 1 || self.counter == 9 || self.counter == 10  || self.counter == 22 {
                                    self.showText.toggle()
                                }
                                
                                if self.counter == 1 || self.counter == 9 || self.counter == 10 || self.counter == 18 || self.counter == 19 || self.counter == 22 {
                                    self.showDare.toggle()
                                }
                                
                                if self.counter == 9 {
                                    self.actionDisplay = "Give a dare to someone"
                                }
                                if self.counter == 18 {
                                    self.actionDisplay = "Get Ready!"
                                }
                                if self.counter == 19 {
                                   self.actionDisplay = "Give two dares to one person of your choice"
                                    self.showLastPick.toggle()
                                    self.showButton.toggle()

                                }
                                if self.counter == 20 {
                                    self.actionDisplay = "Give half of the people in the room a dare"
                                    
                                    self.nameChooser = ""
                                }
                                if self.counter == 21 {
                                   self.actionDisplay = "Give everyone a dare"
                                   
                                    self.nameChooser = ""
                                }
                                if self.counter == 22 {
                                    self.showButton.toggle()
                                    self.showLastPick.toggle()
                                }
                                
                                if self.counter != 1 && self.counter != 10 {
                                    if self.arrayCount < self.playerNameArrayCount - 1 {
                                        self.arrayCount+=1
                                    }else{
                                        self.arrayCount = 0
                                    }
                                }
                                                
                            }
                            
                        }
                        .onAppear {
                    
                            if self.questionManager.firstColor == Color.dareFirstColor {
                                        self.showAlert.toggle()
                                    }
                            
                            self.playerNameArrayCount = 0
                            self.arrayCount = 0
                            
                            for n in 0...self.playerManager.playerNameArray.count - 1 {
                                if self.playerManager.playerNameArray[n] != ""{
                                    self.playerNameArrayCount+=1
                                }
                            }
                            print(self.playerNameArrayCount)
                        }
              
        
                    //Sample Dares
                    VStack{
                                Spacer()
                                SampleDareView()
                                    .padding(.bottom, 30)
                                    .opacity(showDare ? 1 : 0)
                        }
        
            
            
            
        }
        
    
    }
}

struct NormalModeView_Previews: PreviewProvider {
    static var previews: some View {
        NormalModeView( show: .constant(false))
    }
}


struct SampleDareView : View {
//    @State var dareArrayText: String = "Dare"
    let dareArray: [String] = ["Give a piggy back to someone", "Sing a song that someone else chooses", "Dance to a song of someone else's choosing", "Do ten push-ups", "Scream as loud as you can", "Pretend to be the opposite gender until it's your turn again", "Eat a mixture of four random ingredients that someone else chooses", "Lick someone else's shoe", "Chug a whole bottle of water", "Let another player sit on your lap until it's your turn again", "Smell someone else's socks for 5 seconds", "Keep your eyes closed until it's your turn again", "Step on a pile of Legos", "Exchange shirts with the person next to you", "Post the 7th picture in your camera roll to social media", "Text your parents something embarrassing", "Let someone text whoever they want on your social media", "Let someone throw an egg at you", "Eat dog food", "Jam your toe into a wall", "Get your legs waxxed", "Drink a cup of hot sauce", "Take a freezing cold shower for a minute"]
    @State var counter = 0
    @EnvironmentObject var questionManager: QuestionManager
    var body: some View{
        ZStack{
            Image("sampleDare")
                .resizable()
                .cornerRadius(20)
                .shadow(radius: 2)
                .frame(width: UIScreen.main.bounds.width / 1.2 , height: 140, alignment: .center)
            
            VStack{
                    Text("Sample Dares:")
                        .foregroundColor(questionManager.firstColor)
                        .font(.custom("Verdana Bold", size: 20))
                        .padding(.bottom, 80)
                  
                }
                
                    
                    Text(dareArray[counter])
                        .foregroundColor(questionManager.firstColor)
                        .font(.custom("Verdana", size: 15))
                        .multilineTextAlignment(.center)
                        .frame(width: 200)
                        .padding(.top, 40)
                    
      
                
            
           
            
            HStack{
                        Button(action: {
                                  self.counter-=1
                              }) {
                                  Image(systemName: "chevron.left")
                                      .foregroundColor(questionManager.firstColor)
                                       .font(.custom("Verdana Bold", size: 30))
                                  
                              }
                              .opacity((counter == 0) ? 0.5 : 1)
                              .disabled((counter == 0) ? true : false)
                              .padding(.leading, 55)
                
                        Spacer()
                }
            .padding(.top, 40)
            
            HStack{
                
                        Spacer()
                
                        Button(action: {
                                self.counter+=1
                            }) {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(questionManager.firstColor)
                                    .font(.custom("Verdana Bold", size: 30))
                            }
                            .opacity((counter == dareArray.count - 1) ? 0.5 : 1)
                            .disabled((counter == dareArray.count - 1) ? true : false)
                        .padding(.trailing, 55)
            }
            .padding(.top, 40)
            
        }
    }
}
