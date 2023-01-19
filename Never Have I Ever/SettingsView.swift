//
//  SettingsView.swift
//  Never Have I Ever
//
//  Created by Ethan on 7/25/20.
//  Copyright © 2020 Ethan. All rights reserved.
//

import Foundation
import SwiftUI


struct SettingsView: View {
    
    @Binding var show: Bool
    
    var body: some View{
        ZStack{
            
            Image("background")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                HStack(spacing: UIScreen.main.bounds.width / 3.3) {
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                }
                    
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.custom("Verdana", size: 24)).bold()
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 20)
                .padding(.leading, 10)
        
                Spacer()
            }
        
            
        
    }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    
}
    
}
