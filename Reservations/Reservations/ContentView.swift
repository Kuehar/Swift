//
//  ContentView.swift
//  Reservations
//
//  Created by kuehar on 2023/04/13.
//

import SwiftUI

struct ContentView: View {
    @State var personCount: Int = 1
    @State var customerName:String = ""
    var body: some View {
        VStack {
            Text("Little Lemon")
            Stepper{
                Text("Reservation for : \(personCount)")
            }onIncrement: {
                personCount += 1
            }onDecrement: {
                personCount = (personCount == 1) ? 1 : personCount-1
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(personCount: 10)
    }
}
