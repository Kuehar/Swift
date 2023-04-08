//
//  ContentView.swift
//  MyJanken
//
//  Created by kuehar on 2023/04/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("gu")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("グー")
                
            Button(action: {
                print("タップされたよ！")
            }){
                Text("じゃんけんをする")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
