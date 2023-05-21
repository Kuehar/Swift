//
//  ContentView.swift
//  GestureDemo
//
//  Created by kuehar on 2023/04/29.
//

import SwiftUI

struct ContentView: View {
    @State private var offsetValue = CGSize.zero
    @State private var amount = Angle.zero
    @State private var finalAmount = Angle.zero
    @State private var MagAmount = 0.0
    @State private var MagFinalAmount = 1.0
    @State private var message = "You can long press and then drag"
    var body: some View {
        let longPress = LongPressGesture()
            .onEnded{
                _ in print("Long Press detected. Now you can drag me")
            }
        
        let drag = DragGesture()
            .onChanged{
                _ in print("Dragging.....")
            }
        
        let sequence = longPress.sequenced(before: drag)
        
        Image("stepn")
            .gesture(sequence)
                
        
        
        
        VStack{
        Text("Hello, world!")
            .padding()
            .onTapGesture(count:2) {
                print("Text Tapped!!")
            }
            Text("Little Lemon Restaurant").onLongPressGesture(minimumDuration: 4, maximumDistance: 15, perform: {
                print("Long Press Detected!!")
            }, onPressingChanged: { state in
            print(state)
            })
            Image("stepn")
                .resizable()
                .frame(width:200,height:300)
                .offset(offsetValue)
                .gesture(
                    DragGesture()
                        .onChanged{
                            gesture in offsetValue = gesture.translation
                        }
                )
            
            Image("stepn")
                .resizable()
                .frame(width:100,height:200)
                .offset(offsetValue)
                .rotationEffect(amount + finalAmount)
                .gesture(
                    RotationGesture()
                        .onChanged{
                            value in amount = value
                        }
                        .onEnded{
                            value in finalAmount += amount
                            amount = .zero
                        }
                )
            Image("stepn")
                .scaleEffect(MagAmount + MagFinalAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged{
                            value in MagAmount = value - 1
                        }
                        .onEnded{
                            value in MagFinalAmount += MagAmount
                            MagAmount = 0
                        }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
