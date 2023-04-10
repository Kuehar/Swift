//
//  MapView.swift
//  MyMap
//
//  Created by kuehar on 2023/04/09.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let searchKeyword:String
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView:MKMapView,context: Context){
        print(searchKeyword)
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(searchKeyword, completionHandler: {
            (placemarks,error) in
            if let unwrapPlacemarks = placemarks,
               let firstPlacemark = unwrapPlacemarks.first ,
               let location = firstPlacemark.location {
                let targetCoordinate = location.coordinate
                
                print(targetCoordinate)
            }
        })
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKeyword: "東京タワー")
    }
}
