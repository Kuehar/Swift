//
//  ParentView.swift
//  Reservations
//
//  Created by kuehar on 2023/04/21.
//

import SwiftUI

struct ParentView: View {
    var body: some View {
        HStack{
            Rectangle()
                .fill(Color.red)
                .frame(width: 50, height: 50)
            Text("Rectangle One")
                .foregroundColor(Color.white)
                .padding(20)
                .background(Color.yellow)
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 30)
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
