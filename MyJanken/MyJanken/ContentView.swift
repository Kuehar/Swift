//
//  ContentView.swift
//  MyJanken
//
//  Created by kuehar on 2023/04/08.
//

import SwiftUI

struct ContentView: View {
    @State var answerNumber = 0
    var body: some View {
        VStack {
            if answerNumber == 0{
                Text("これからじゃんけんを始めます")
            }else if answerNumber == 1{
                Image("gu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Text("グー")
            }else if answerNumber == 2{
                Image("choki")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()

                Text("チョキ")
                    .padding(.bottom)
            }else{
                Image("pa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()

                Text("パー")
                    .padding(.bottom)
            }
                
            Button(action: {
                answerNumber = Int.random(in: 1...3)
                
                var newAnswerNumber = 0
                
                repeat{
                    newAnswerNumber = Int.random(in: 1...3)
                }while answerNumber == newAnswerNumber
                
                answerNumber = newAnswerNumber
                
            }){
                Text("じゃんけんをする")
                    .frame(maxWidth:.infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
