//
//  ContentView.swift
//  Never Have I Ever
//
//  Created by Ethan on 6/12/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    let playerArray = [2, 3, 4, 5, 6, 7, 8]
    @State var show = false
    @EnvironmentObject var playerManager: PlayerManager
    var body: some View {
        NavigationView{
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("Logo3")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 1.2, height: 320, alignment: .center)
                    .padding(.bottom, -30)
                Text("Players:")
                    .foregroundColor(Color.white)
                    .font(.custom("Hiragino Sans", size: 21))
                
                    

                Picker(selection: $playerManager.index, label: Text("Players")) {
                    ForEach(0 ..< playerArray.count) {
                        Text(String(self.playerArray[$0]))
                            .foregroundColor(Color.white)
                            .tag($0)
                    }

                }.labelsHidden()
                NavigationLink(destination: PlayerView().onAppear(){
                    self.playerManager.numberOfPlayers = self.playerArray[self.playerManager.index]
                }) {
                    HStack{
                        Text("Next")
                            .foregroundColor(Color(.systemBlue))
                            .font(.custom("Hiragino Sans", size: 19))
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.all, 18)
                .padding([.leading, .trailing], 10)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: .black, radius: 1, x: 0, y: 0)


                    
            }
            .padding(.bottom, 90)
            
            
            VStack{
                
               
                
                HStack{
                    
                     Spacer()
                    
                    NavigationLink(destination: SettingsView(show: $show), isActive: $show) {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                            .font(.custom("Verdana Bold", size: 30))
                    }
                    .padding([.top, .trailing], 25)
                }
                
                Spacer()
            }
            
        }
        
        
        }
    .navigationBarTitle("")
    .navigationBarHidden(true)
        
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PlayerManager())
    }
}
