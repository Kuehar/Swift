//
//  GestureRecognizer.swift
//  GestureDemo
//
//  Created by kuehar on 2023/04/30.
//

import SwiftUI

struct GestureRecognizer: View {
    @State private var flag = false
    var body: some View {
        Text("Tap me")
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding(15)
            .background(flag ? Color.green:Color.yellow)
            .onTapGesture {
                flag.toggle()
            }
    }
}

struct GestureRecognizer_Previews: PreviewProvider {
    static var previews: some View {
        GestureRecognizer()
    }
}
