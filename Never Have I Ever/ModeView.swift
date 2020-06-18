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
    @State var showing: Bool = false
    var body: some View {
        NavigationView{
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
//                    NavigationLink(destination: PlayerView()) {
//                        Image(systemName: "chevron.left")
//                            .font(.system(size: 24, weight: .bold))
//                            .foregroundColor(.white)
//                    }
                    
                    Text("Mode")
                        .foregroundColor(.white)
                        .font(.custom("Hiragino Sans", size: 25)).bold()
                        .frame( alignment: .center)
                     
                    Spacer(minLength: 0)
                }
                    
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 23)
                .padding([.horizontal, .bottom])
                Spacer()
                VStack(spacing: -16){
                    
                    Image("normcrop")
                        .resizable()
                        .frame(width:UIScreen.main.bounds.width / 1.2 ,height: UIScreen.main.bounds.height / 5.9)
                        .cornerRadius(17)
                        .padding()
                        .shadow(color: .black, radius: 2, x: 0, y: 0)
                        .onTapGesture {
                            self.showing.toggle()
                    }
                  
               Image("sportscrop")
                    .resizable()
                    .frame(width:UIScreen.main.bounds.width / 1.2 ,height: UIScreen.main.bounds.height / 5.9)
                        .cornerRadius(17)
                    .padding()
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
               .onTapGesture {
                       self.showing.toggle()
               }
                    
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
                Spacer(minLength: 30)
                Text("More Modes Coming Soon...")
                    .font(.custom("Hiragino Sans", size: 24))
                .bold()
                    .foregroundColor(.white)
                    
                Spacer(minLength: 0)
            }
            .padding(.bottom, 250)
        }
    
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


struct ModeView_Previews: PreviewProvider {
    static var previews: some View {
        ModeView(show: .constant(false)).environmentObject(PlayerManager())
    }
}
