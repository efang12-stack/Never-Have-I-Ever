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
    @State var actionDisplay = "Take a dare"
    @State var animations = false
    @State var showText = false
    @State var showLastPick = false
    @State var nameChooser = ""
    @State var showButton = false
    @State var counter = 0
    @State var font: String = "Verdana Bold"
    @State var sizeText: Int = 58
    @State var showAlert: Bool = false
    @Binding var show: Bool
    @EnvironmentObject var questionManager: QuestionManager
    @EnvironmentObject var playerManager: PlayerManager
    
    var body: some View {
        
    ZStack{
            LinearGradient(gradient: Gradient(colors: [questionManager.firstColor, questionManager.secondColor]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                if self.counter == 6 {
                  
                    self.sizeText = 58
                    self.font = "Verdana Bold"
                    self.questionDisplay = "Round 2"
                    self.counter+=1
                }
                else if self.counter == 13 {
                    self.sizeText = 58
                    self.font = "Verdana Bold"
                    self.questionDisplay = "Last Round"
                    self.counter+=1
                }
                else if self.counter == 17{
                    self.sizeText = 58
                    self.font = "Verdana Bold"
                    self.questionDisplay = "Finished!"
                    self.counter+=1
                }
                else if self.counter > 17 {
                    self.sizeText = 58
                    self.font = "Verdana Bold"
                    self.questionDisplay = "Finished!"
                    self.counter+=1
                }
                else{
                self.counter+=1
                    self.sizeText = 18
                    self.font = "Verdana"
                    if self.counter < 19 {
                self.questionDisplay = self.questionManager.chosenArray[Int.random(in: 0...self.questionManager.chosenArray.count-1)]
//
//                        self.actionDisplay = self.questionManager.dareArray[Int.random(in: 0...self.questionManager.dareArray.count-1)]
                    }
                }
                
                if self.counter == 1 || self.counter == 7 || self.counter == 8  || self.counter == 18 {
                    self.showText.toggle()
                }
                
                if self.counter == 7 {
                    self.actionDisplay = "Give out a dare"
                }
                if self.counter == 14 {
                    self.actionDisplay = "Get Ready!"
                }
                if self.counter == 15 {
                   self.actionDisplay = "Give two dares to one person of your choice"
                    self.showLastPick.toggle()
                    self.showButton.toggle()

                }
                if self.counter == 16 {
                    self.actionDisplay = "Give half of the people in the room a dare"
                    
                    self.nameChooser = ""
                }
                if self.counter == 17 {
                   self.actionDisplay = "Give everyone a dare"
                   
                    self.nameChooser = ""
                }
                if self.counter == 18 {
                    self.showButton.toggle()
                    self.showLastPick.toggle()
                }
                                
            }
            
        VStack{
                
              
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
                        
                    }
                    .padding(.bottom, 140)
                
                VStack(spacing: 30){
                        
                        Text(questionDisplay)
                            .onTapGesture {
                    
                    if self.counter == 6 {
                        
                        self.sizeText = 58
                        self.font = "Verdana Bold"
                        self.questionDisplay = "Round 2"
                        self.counter+=1
                    }
                    else if self.counter == 13 {
                        self.sizeText = 58
                        self.font = "Verdana Bold"
                        self.questionDisplay = "Last Round"
                        self.counter+=1
                    }
                    else if self.counter == 17{
                        self.sizeText = 58
                        self.font = "Verdana Bold"
                        self.questionDisplay = "Finished!"
                        
                    }
                    else if self.counter > 17 {
                        self.sizeText = 58
                        self.font = "Verdana Bold"
                        self.questionDisplay = "Finished!"
                        self.counter+=1
                    }
                    else{
                        self.counter+=1
                        self.sizeText = 18
                        self.font = "Verdana"
                        if self.counter < 19 {
                            self.questionDisplay = self.questionManager.chosenArray[Int.random(in: 0...self.questionManager.chosenArray.count-1)]
                            
    //                        self.actionDisplay = self.questionManager.dareArray[Int.random(in: 0...self.questionManager.dareArray.count-1)]
                        }
                    }
                    
                    if self.counter == 1 || self.counter == 7 || self.counter == 8  || self.counter == 18 {
                        self.showText.toggle()
                        
                    }
                    
                    if self.counter == 7 {
                        self.actionDisplay = "Give out a dare"
                    }
                    if self.counter == 14 {
                        self.actionDisplay = "Get Ready!"
                    }
                    if self.counter == 15 {
                        self.actionDisplay = "Give 2 dares to one person"
                        self.showLastPick.toggle()
                        self.showButton.toggle()
                        
                    }
                    if self.counter == 16 {
                        self.actionDisplay = "Give half of the people in the room a dare"
                        
                        self.nameChooser = ""
                    }
                    if self.counter == 17 {
                        self.actionDisplay = "Give everyone a dare"
                        
                        self.nameChooser = ""
                    }
                    if self.counter == 18 {
                        self.showButton.toggle()
                        self.showLastPick.toggle()
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
                    
                        if self.counter == 6 {
                        
                            self.sizeText = 58
                            self.font = "Verdana Bold"
                            self.questionDisplay = "Round 2"
                            self.counter+=1
                        }
                        else if self.counter == 13 {
                            self.sizeText = 58
                            self.font = "Verdana Bold"
                            self.questionDisplay = "Last Round"
                            self.counter+=1
                        }
                        else if self.counter == 17{
                            self.sizeText = 58
                            self.font = "Verdana Bold"
                            self.questionDisplay = "Finished!"
                            
                        }
                        else if self.counter > 17 {
                            self.sizeText = 58
                            self.font = "Verdana Bold"
                            self.questionDisplay = "Finished!"
                            self.counter+=1
                        }
                        else{
                        self.counter+=1
                            self.sizeText = 18
                            self.font = "Verdana"
                            if self.counter < 19 {
                        self.questionDisplay = self.questionManager.chosenArray[Int.random(in: 0...self.questionManager.chosenArray.count-1)]
    //
    //                            self.actionDisplay = self.questionManager.dareArray[Int.random(in: 0...self.questionManager.dareArray.count-1)]
                            }
                        }
                        
                        if self.counter == 1 || self.counter == 7 || self.counter == 8  || self.counter == 18 {
                            self.showText.toggle()
                        }
                        
                        if self.counter == 7 {
                            self.actionDisplay = "Give out a dare"
                        }
                        if self.counter == 14 {
                            self.actionDisplay = "Get Ready!"
                        }
                        if self.counter == 15 {
                        self.actionDisplay = "Give 2 dares to one person of your choice"
                            self.showLastPick.toggle()
                    self.showButton.toggle()

                        }
                        if self.counter == 16 {
                            self.actionDisplay = "Give half of the people in the room a dare"
                        
                            self.nameChooser = ""
                        }
                        if self.counter == 17 {
                        self.actionDisplay = "Give everyone a dare"
                            self.nameChooser = ""
                        }
                        if self.counter == 18 {
                            self.showButton.toggle()
                            self.showLastPick.toggle()
                        }
                    
                        
                    }
                        
                    }
                
        }
                .padding(.top, -230)
                .onAppear {
                    
                        if self.questionManager.firstColor == Color.dareFirstColor {
                            self.showAlert.toggle()
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
            
            
        }
        
    
    }
}

struct NormalModeView_Previews: PreviewProvider {
    static var previews: some View {
        NormalModeView( show: .constant(false))
    }
}
