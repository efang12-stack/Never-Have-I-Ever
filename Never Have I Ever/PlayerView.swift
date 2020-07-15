//
//  PlayerView.swift
//  Never Have I Ever
//
//  Created by Ethan on 6/13/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import SwiftUI


struct PlayerView: View {
    @EnvironmentObject var playerManager: PlayerManager
    @State var value: CGFloat = 0
    @State var show = false
    var body: some View {
    
        ZStack{
            
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
            
            VStack{
                
                    Image("Logo3")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: 320, alignment: .center)
                        .padding(.bottom, -40)
                
                if playerManager.numberOfPlayers != 0 {

                    ScrollView{
                        
                        ForEach(1..<playerManager.numberOfPlayers+1, id: \.self) {n in
                            TextField("Player \(n)", text: self.$playerManager.playerNameArray[n-1])
                                .font(.custom("Hiragino Sans", size: 18))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(width: UIScreen.main.bounds.width / 2 , height: 30)
                        }
                    }
                    .frame( height: UIScreen.main.bounds.height / 2.3 )
                    .padding(.bottom, 10)
                    
                }
                
                
                    NavigationLink(destination: ModeView(show: $show), isActive: self.$show) {
                        
                            HStack{
                                
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(Color(.systemBlue))
                                
                                Text("Start")
                                    .foregroundColor(Color(.systemBlue))
                                    .font(.custom("Hiragino Sans", size: 19))
                                }
                        
                }
                .opacity((playerManager.playerNameArray[0] == "" || playerManager.playerNameArray[1] == "") ? 0.35 : 1)
                .disabled((playerManager.playerNameArray[0] == "" || playerManager.playerNameArray[1] == "") ? true : false)
            
                .padding(.all, 15)
                .padding([.leading, .trailing], 15)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 1, x: 0, y: 0)
                
                AdView()
                .frame(width: UIScreen.main.bounds.width / 1.2 , height: 60)
                                       .padding(.top, 17)
                
            }
            .offset(y: -self.value).animation(.spring()).onAppear{
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                    
                    let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    
                    let height = value.height
                    
                    self.value = height - 70
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
          
                                 self.value = 0
                             }
                
            }
            .padding(.bottom, 150)
        }
        
    }
}


struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
