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
   let questionArray = ["If you have eaten pizza", "If you like cheese", "If you are rich"]
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
        }
    }
}

struct DareView: View {
    
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
        }
        
    }
}


struct ModeView_Previews: PreviewProvider {
    static var previews: some View {
        ModeView(show: .constant(false)).environmentObject(PlayerManager())
    }
}
