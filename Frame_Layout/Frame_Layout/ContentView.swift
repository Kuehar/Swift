//
//  ContentView.swift
//  Frame_Layout
//
//  Created by kuehar on 2023/04/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading ){
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello World!!")
                .padding()
            HStack{
                Button("One"){}
                Button("Second"){}
                Button("Three"){}
                
            }
        }
        .frame(width:300,alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
