//
//  MyTapView.swift
//  Identifiable
//
//  Created by kuehar on 2023/04/27.
//

import SwiftUI

struct MyTapView: View {
    var body: some View {
        VStack{
            TabView{
                Text("This is the Share view.")
                    .tabItem({
                        Label("Share",systemImage: "square.and.arrow.up")
                    })
                Text("This is the Trash View")
                    .tabItem({
                        Label("",systemImage: "trash")
                    })
            }
        }
    }
}

struct MyTapView_Previews: PreviewProvider {
    static var previews: some View {
        MyTapView()
    }
}
