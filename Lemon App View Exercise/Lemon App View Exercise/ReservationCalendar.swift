//
//  ReservationCalendar.swift
//  Lemon App View Exercise
//
//  Created by kuehar on 2023/04/20.
//

import SwiftUI

struct ReservationCalendar: View {
    @State private var reservationDate = Date()
    var body: some View {
        Form{
            HStack{
                DatePicker(
                    "Start Date",
                    selection:$reservationDate,
                    in:Date()...,
                    displayedComponents: [.date,.hourAndMinute]
                )
                Button(action:{
                    print("do something!") }) {
                        HStack{
                            Image(systemName: "arrow.right.circle")
                            Text("Done")
                    }
                    }.padding(20)
            }
            Text("Chose Date is \(reservationDate.formatted(date:.long,time:.complete))")
        }
        
    }
}

struct ReservationCalendar_Previews: PreviewProvider {
    static var previews: some View {
        ReservationCalendar()
    }
}
