//
//  Model.swift
//  Little Lemon Reservation
//
//  Created by Amir Aynetchi on 29/03/2023.
//

import SwiftUI

@MainActor class Model: ObservableObject{
    @Published var reservationForm = false
    @Published var tabViewSelectedIndex = 0
    @Published var reservations: [Reservation] = []
}
//Reservation(city: "Some City", area: "Some Area", date: Date(), time: Date(), name: "Some name", email: "Some City", phone: "Some City", guests:4)
