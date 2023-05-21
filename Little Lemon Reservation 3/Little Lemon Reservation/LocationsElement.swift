//
//  LocationsElement.swift
//  Little Lemon Reservation
//
//  Created by Amir Aynetchi on 28/03/2023.
//

import SwiftUI


struct LocationsElement: View {
    
    let city: String
    let area: String
    let contact: String
    
    var body: some View {
        VStack(alignment: .center) {
            
            
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 12.5)
                .frame(width: 320, height: 70)
                .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
            VStack(alignment: .leading){
                Label{
                    Text("\(city) - \(area)")
                        .font(.system(size: 16, weight: .bold))
                } icon: {
                    Image(systemName: "location.fill")
                }
                
                Label{
                    Text(contact)
                    
                } icon: {
                    Image(systemName: "phone.fill")
                }
                
            }
            .padding(12)
            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
            
            
        }
    }
        
        
    }
}

struct LocationsElement_Previews: PreviewProvider {
    static var previews: some View {
        LocationsElement(city: "Paris", area: "Notre Dam", contact: "879769678568")
    }
}


