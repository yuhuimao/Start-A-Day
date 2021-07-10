//
//  ToDoListView.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/5.
//

import SwiftUI
import UIKit

struct ToDoListCardView: View {
    private let toDoListController = ToDoListController.shared
    @State private var toDoThingsKeys: [String] = ToDoListController.shared.getToDoThingsKeys()
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .leading) {
                HStack {
                    Text("待辦清單")
                        .font(.title3)
                        .foregroundColor(.orange)
                        .bold()
                    Text("\(toDoThingsKeys.count)")
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading) {
                    let keys = toDoListController.topThreeThings()
                    
                    ForEach(keys, id: \.self) { keys in
                        let value = toDoListController.getThings(key: keys)
                        Text(value)
                    }
                }
                .font(.system(size: 18))
                .foregroundColor(.white)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black)
        .cornerRadius(20)
        .aspectRatio(1, contentMode: .fit)
    }
}

struct ToDoListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListCardView()
    }
}
