//
//  ToDoListView.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/5.
//

import SwiftUI
import UIKit

struct ToDoListView: View {
    var body: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .leading) {
                HStack {
                    Text("待辦清單")
                        .font(.title3)
                        .foregroundColor(.orange)
                        .bold()
                    Text("0")
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading) {
                    Text("Item1")
                    Text("Item1")
                    Text("Item1")
                }
                .font(.system(size: 18))
                .foregroundColor(.white)
            }
        }
        .frame(width: 180, height: 180, alignment: .center)
        .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
        .background(Color.black)
        .cornerRadius(10)
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}