//
//  ViewReservations.swift
//  Little Lemon Reservation
//
//  Created by Amir Aynetchi on 28/04/2023.
//

import SwiftUI

struct ViewReservations: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        
        VStack {
            Image("Logo")
            
            Text("My Reservations")
                .font(.system(size: 16, weight: .bold))
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                .cornerRadius(20)
                
            
            if model.reservations.count == 0 {
                Text("No reservations found")
                    .padding(.top, 200)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                Spacer()
                
            } else {
                
                ScrollView{
                    ForEach(model.reservations) { index in
                        Group {
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 12.5)
                                    .frame(width: 340, height: 80)
                                    .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                                
                                
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("\(index.city) (\(index.area))")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                        HStack{
                                            VStack(alignment:.leading, spacing: 4) {
                                                Label {
                                                    Text("\(getTimeString(index.time, "yyyy-MM-dd"))")
                                                        .font(.system(size: 14))
                                                } icon: {
                                                    Image(systemName: "calendar.circle")
                                                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                                }
                                                Label {
                                                    Text("\(getTimeString(index.time, "hh:mm a"))")
                                                        .font(.system(size: 14))
                                                } icon: {
                                                    Image(systemName: "clock.fill")
                                                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                                }
                                            }
                                            .padding(.trailing, 130)
                               
                                            
                                            Label {
                                                Text("\(index.guests)")
                                                    .font(.system(size: 14))
                                            } icon: {
                                                Image(systemName: "person.3.fill")
                                                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                            }
                                            
                                            
                                            
                                        }
                                    }
                                    .padding(12)
                                  
                                                       }
                        }
                    }
                    Spacer() // Add Spacer to push everything to the top of the screen
                }
            }
        }
    }
    func getTimeString(_ date: Date, _ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
    struct ViewReservations_Previews: PreviewProvider {
        static var previews: some View {
            ViewReservations().environmentObject(Model())
        }
    }
    

