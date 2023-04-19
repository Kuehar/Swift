//
//  ContentView.swift
//  Frame_Layout
//
//  Created by kuehar on 2023/04/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .leading ){
            Circle()
                .foregroundColor(Color.gray)
            Circle()
                .scale(x:0.75,y:0.75)
                .foregroundColor(Color.red)
            VStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello World!!")
                    .padding()
                Spacer()
                HStack(spacing:20){
                    Button("One"){}
                    Button("Two"){}
                }
                .frame(maxHeight:.infinity,alignment: .top)
            }
            .frame(maxWidth:.infinity,alignment: .trailing)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
