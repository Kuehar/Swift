//
//  ReservationForm.swift
//  Little Lemon Reservation
//
//  Created by Amir Aynetchi on 29/03/2023.
//

import SwiftUI

struct ReservationForm: View {
    let city: String
    let area: String
    let telephone: String
    @State var showFormInvalidMessage = false
    @State var errorMessage = ""
    @State private var selectedDate = Date()
    @State private var selectedTime = 0
    @State private var availableTimes = [Date]()
    @State private var selectedGuests = 1
    @State private var email = ""
    @State private var name = ""
    @State private var contact = ""
    @State private var failed = true

    @EnvironmentObject var model: Model
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var mustChangeReservation = false
    

    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        ScrollView(.vertical) {
            
            
            VStack(alignment:.leading) {
                HStack{
                    Text("Name")
                        .padding(8)
                        .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                        .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .cornerRadius(10)
                        .frame(width:80)
                    
                    TextField("Enter your name...",
                              text: $name)
                    
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(Color(red: 244/255, green: 206/255, blue: 20/255))
                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                    .padding(.trailing, 10)
                }
                .padding(.leading, 10)
                .padding(.bottom, 10)
                
                
                HStack{
                    Text("Email ")
                        .padding(8)
                        .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                        .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .cornerRadius(10)
                        .frame(width:80)
                    
                    TextField("Enter your email...",
                              text: $email)
                    
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(Color(red: 244/255, green: 206/255, blue: 20/255))
                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding(.trailing, 10)
                }
                .padding(.leading, 10)
                .padding(.bottom, 10)
                
                
                HStack{
                    Text("Phone")
                        .padding(8)
                        .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                        .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .cornerRadius(10)
                        .frame(width:80)
                    
                    TextField("Enter your contact number...",
                              text: $contact)
                    
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(Color(red: 244/255, green: 206/255, blue: 20/255))
                    .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .cornerRadius(10)
                    .textContentType(.telephoneNumber)
                    .keyboardType(.phonePad)
                    .padding(.trailing, 10)
                }
                .padding(.leading, 10)
                .padding(.bottom, 20)
                
                
                
                Text("Select Number of Guests")
                    .padding(8)
                    .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                    .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .cornerRadius(10)
                    .padding(.leading, 18)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(1...10, id: \.self) { guestCount in
                            Button(action: {
                                selectedGuests = guestCount
                            }) {
                                Text("\(guestCount)")
                                    .font(.title)
                                    .frame(width: 50, height: 50)
                                    .background(selectedGuests == guestCount ? Color(red: 73/255, green: 94/255, blue: 87/255) : Color(red: 244/255, green: 206/255, blue: 20/255))
                                    .foregroundColor(selectedGuests == guestCount ? Color(red: 244/255, green: 206/255, blue: 20/255) : Color(red: 73/255, green: 94/255, blue: 87/255))
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 30)
                }
                
                Text("Select a Date and Time")
                    .padding(8)
                    .foregroundColor(Color(red: 244/255, green: 206/255, blue: 20/255))
                    .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                    .cornerRadius(10)
                    .padding(.leading, 18)
                
                DatePicker("", selection: $selectedDate, in: Date()..., displayedComponents: [.date])
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding(20)
                
                if !availableTimes.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(availableTimes.indices, id: \.self) { index in
                                Button(action: {
                                    self.selectedTime = index
                                }) {
                                    Text(timeFormatter.string(from: availableTimes[index]))
                                        .font(.title2)
                                        .foregroundColor(selectedTime == index ? Color(red: 244/255, green: 206/255, blue: 20/255) : Color(red: 73/255, green: 94/255, blue: 87/255))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(selectedTime == index ? Color(red: 73/255, green: 94/255, blue: 87/255) : Color(red: 244/255, green: 206/255, blue: 20/255))
                                        .cornerRadius(20)
                                }
                            }
                        }
                        
                        
                    }
                    .padding(.leading, 20)
                    
                    Button(action: {
                        validateForm()}, label: {
                            Text("Reserve")
                                .padding(.init(top: 15, leading: 100, bottom: 15, trailing: 100))
                                .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                                .background(Color(red: 244/255, green: 206/255, blue: 20/255))
                                .cornerRadius(30)
                        })
                    .padding(.top, 20)
                    .padding(.leading, 65)
                    
                    
                }
            }
        .scrollContentBackground(.hidden)
        
        //.navigationBarTitle(dateFormatter.string(from: selectedDate))
        .onAppear {
            getAvailableTimes()
            
        }
        .onChange(of: selectedDate) { _ in
            getAvailableTimes()
        }
        .alert("Error", isPresented: $showFormInvalidMessage, actions:{
            Button("OK", role: .cancel) {}
        }, message: {
            Text(self.errorMessage)
        })
        
    }
    }
    
    func isValid(name: String) -> Bool {
        guard !name.isEmpty,
              name.count > 2
        else { return false }
        for chr in name {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") && !(chr == " ") ) {
                return false
            }
        }
        return true
    }
    
    func isValid(email:String) -> Bool {
        guard !email.isEmpty else { return false }
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: email)
    }
    
    private func validateForm(){
        let nameIsValid = isValid(name: name)
        let emailIsValid = isValid(email: email)
        
        guard nameIsValid && emailIsValid
        else{
            var invalidNameMessage = ""
            if name.isEmpty || !isValid(name: name){
                invalidNameMessage = "Names can only contain letters and must have at least 3 characters\n\n"
            }
            var invalidPhoneMessage = ""
            if contact.isEmpty{
                invalidPhoneMessage = "The phone number cannot be blank.\n\n"
            }
            var invalidEmailMessage = ""
            if email.isEmpty || !isValid(email: email){
                invalidEmailMessage = "The e-mail is invalid and cannot be blank."
            }
            self.errorMessage = "Found these errors in the form:\n\n \(invalidNameMessage)\(invalidPhoneMessage)\(invalidEmailMessage)"
            showFormInvalidMessage.toggle()
            return
        }
        let temporaryReservation = Reservation(city: city, area: area, date:selectedDate, time:availableTimes[selectedTime], name:name, email:email, phone:contact, guests:selectedGuests)
        
        model.reservations += [temporaryReservation]
        self.mustChangeReservation.toggle()
        self.presentationMode.wrappedValue.dismiss()
        
        

    }
    
    private func getAvailableTimes() {
        let calendar = Calendar.current
        let currentHour = calendar.component(.hour, from: Date())
        let currentMinute = calendar.component(.minute, from: Date())
        
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: selectedDate)
        components.hour = 1
        components.minute = 0
        
        let openingTime = calendar.date(from: components)!
        
        components.hour = 24
        components.minute = 0
        
        let closingTime = calendar.date(from: components)!
        
        var availableTimes = [Date]()
        var currentDate = openingTime
        
        if calendar.isDateInToday(selectedDate) {
            let nextHourDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
            let roundedDate = Calendar.current.date(bySetting: .minute, value: 0, of: nextHourDate)!
            currentDate = max(currentDate, roundedDate)
        }
        
        while currentDate < closingTime {
            if currentDate > Date() || calendar.isDateInToday(selectedDate) {
                availableTimes.append(currentDate)
            }
            currentDate = calendar.date(byAdding: .minute, value: 15, to: currentDate)!
        }
        
        self.availableTimes = availableTimes
        self.selectedTime = 0
    }
}

struct Reservation: Identifiable {
    let id = UUID()
    let city: String
    let area: String
    let date: Date
    let time: Date
    let name: String
    let email: String
    let phone: String
    let guests: Int
}
struct ReservationForm_Previews: PreviewProvider {
    static var previews: some View {
        ReservationForm(city:"", area:"", telephone:"").environmentObject(Model())
    }
}
