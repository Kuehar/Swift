//
//  Little_Lemon_ReservationApp.swift
//  Little Lemon Reservation
//
//  Created by Amir Aynetchi on 28/03/2023.
//

import SwiftUI

@main
struct Little_Lemon_ReservationApp: App {
    @StateObject var model = Model()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(model)
        }
    }
}
