import SwiftUI

struct ContentView: View {
    @State var inputValue:String = ""
    var body: some View {
        TextField("Type your name",text: $inputValue,onEditingChanged: {
            status in print(status)
        })
            .onChange(of: inputValue, perform: {
                newValue in print(newValue)
            })
            .onSubmit {
                print("submitted")
            }
            .padding()
        
        
        /*
        Text("Little Lemon Restaurant")
            .font(.title)
            .foregroundColor(.gray)
            .background(Color.black)
            .padding()
            .background(Color.gray)
         */

        
    }
}
