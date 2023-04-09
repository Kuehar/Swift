//
//  ContentView.swift
//  MyMusic
//
//  Created by kuehar on 2023/04/09.
//

import SwiftUI

struct ContentView: View {
    let soundPlayer = SoundPlayer()
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
            
            HStack{
                Button(action:{
                    soundPlayer.cymbalPlay()
                }){
                    Image("cymbal")
                        .renderingMode(.original)
                }
                
                Button(action:{
                    soundPlayer.guitarPlay()
                }){
                    Image("guitar")
                        .renderingMode(.original)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
