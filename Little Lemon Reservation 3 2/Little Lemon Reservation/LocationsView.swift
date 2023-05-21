//
//  LocationsView.swift
//  Little Lemon Reservation
//
//  Created by Amir Aynetchi on 28/03/2023.
//

import SwiftUI

struct LocationsView: View{
    @EnvironmentObject var model: Model
    @ObservedObject private var locations = AllLocations()
    var body: some View{
        VStack{
            // Displaying the logo
            Image("Logo")
            // Displaying heading (changes as page navigates)
            Text(model.reservationForm ? "Reservation Form": "Select Location")
                .font(.system(size: 16, weight: .bold))
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                .cornerRadius(20)
            
            NavigationView{
                ScrollView{
                    ForEach(locations.locations){ loc in
                        NavigationLink(destination: ReservationForm(city: loc.city, area: loc.area, telephone: loc.contact), label: {
                            LocationsElement(city: loc.city, area: loc.area, contact: loc.contact)
                            .onAppear(perform: {
                                model.reservationForm =  false
                                })
                            .onDisappear(perform: {
                                model.reservationForm =  true
                                })
                        })
                    }
                        
                }
                
            }
            
            
        }
    }
}
    
    

struct Location: Identifiable {
    let id = UUID()
    let city: String
    let area: String
    let contact: String
}

class AllLocations: ObservableObject {
    @Published var locations: [Location] = getLocations()
    
    static func getLocations() -> [Location] {
        return [
            Location(city: "Paris", area: "Notre Dam", contact: "+33 700 555 768"),
            Location(city: "Brussels", area: "Midi", contact: "+32 456 674 865"),
            Location(city: "Luxembourg", area: "Hamilius", contact: "+352 334 456"),
            Location(city: "Lyon", area: "Gare", contact: "+33 700 467 768"),
            Location(city: "Rotterdam", area: "University", contact: "+31 645 485 123"),
            Location(city: "Amsterdam", area: "Centrum", contact: "+31 756 875 183"),
            Location(city: "Maastricht", area: "City", contact: "+31 863 875 642"),
            Location(city: "Paris", area: "Gare", contact: "+33 700 752 768"),
            Location(city: "Dubai", area: "Palm", contact: "+971 374 3742"),
            Location(city: "New York", area: "Empire State", contact: "+1800 374 362 613"),
            Location(city: "Miami", area: "Palm Beach", contact: "+1800 467 746 534"),
            Location(city: "Barcelona", area: "Beach", contact: "+34 374 475 373"),
            Location(city: "Milan", area: "City", contact: "+34 456 535 761"),
            Location(city: "Rome", area: "Cathedral", contact: "+34 353 535 645"),
            Location(city: "Seoul", area: "Train Station", contact: "+82 356 436 945")
        ]
    }
    
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}


