//
//  Contorol.swift
//  Lemon App View Exercise
//
//  Created by kuehar on 2023/04/20.
//

import SwiftUI

struct Contorol: View {
    @State var isShowing:Bool = true
    @State private var value:Int = 1
    @State private var size: CGFloat = 0.1
    @State var selectedDate = Date()
    
    var dateClosedRange:ClosedRange<Date>{
        let min = Calendar.current.date(byAdding:.day,value:-1,to:Date())!
        let max = Calendar.current.date(byAdding:.day,value:1,to:Date())!
        return min...max
    }
    
    
    
    var body: some View {
        VStack{
            Button(role:.destructive){
                print("do something!!")
            }label:{
                HStack{
                    Image(systemName: "trash")
                    Text("")
                }
            }
            
            Toggle(isOn:$isShowing){
                Text("Toggle sample")
            }
            
            Text("Current value: \(value)")
            Stepper("Number of guests",value:$value,in:1...20)
            
            Text("Little Lemon")
                .font(.system(size:size*50))
            Slider(value:$size)
            
            Label("Menu",systemImage: "font.knife")
                .labelStyle(.titleAndIcon)
            
            NavigationView{
                Form{
                    Section{
                        DatePicker(
                            selection:$selectedDate,
                            in:dateClosedRange,
                            displayedComponents: .date,
                            label:{Text("Due Date")}
                        )
                    }
                }
            }
        }
    }
}

struct Contorol_Previews: PreviewProvider {
    static var previews: some View {
        Contorol()
    }
}
