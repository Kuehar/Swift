//
//  MainView.swift
//  Little Lemon Reservation
//
//  Created by Amir Aynetchi on 28/03/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var model = Model()
    @State var tabSelection = 0
    
    var body: some View {
        
        TabView{
            LocationsView()
                .tag(0)
                .tabItem{
                    
                        Label("Locations", systemImage: "fork.knife")
                    
                }
            ViewReservations()
                .tag(1)
                .tabItem{
                    
                        Label("Reservation", systemImage: "square.and.pencil")
                    
                }
        }
        
    }
    
}

    
   


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Model())
    }
}
