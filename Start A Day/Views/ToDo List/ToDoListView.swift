//
//  ToDoListView.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/10.
//

import SwiftUI

struct ToDoListView: View {
    private let toDoListController = ToDoListController.shared
    @State private var toDoThingsKeys: [String] = ToDoListController.shared.getToDoThingsKeys()
    @State private var thing = ""
    @State private var finishTings: Set<String> = []
    
    var body: some View {
        ZStack {
            VStack {
                HStack() {
                    TextField("請輸入代辦事項", text: $thing)
                        .font(.system(size: 25))
                        .padding(.leading, 12)
                    
                    Button(action: {
                        guard !thing.isEmpty else { return }
                        
                        toDoListController.addThing(thing: thing)
                        toDoThingsKeys = toDoListController.getToDoThingsKeys()
                        thing = ""
                    }) {
                        Text("＋")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    .background(Color.green)
                }
                .border(Color.gray, width: 0.5)
                .padding(EdgeInsets(top: 32, leading: 16, bottom: 0, trailing: 16))
                
                Spacer()
                
                if toDoThingsKeys.isEmpty {
                    Text("沒有代辦事項")
                } else {
                    List {
                        ForEach(toDoThingsKeys, id: \.self) { key in
                            HStack {
                                Button(action: {
                                    finishTings.insert(key)
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                        toDoListController.finishThing(key: key)
                                        toDoThingsKeys = toDoListController.getToDoThingsKeys()
                                    })
                                }) {
                                    finishTings.contains(key) ? Image(systemName: "largecircle.fill.circle") : Image(systemName: "circle")
                                }
                                
                                let value = toDoListController.getThings(key: key)
                                Text("\(value)")
                            }
                            .font(.system(size: 20))
                        }
                    }
                    // 若button style為default的話會讓整個row的點擊有button action的效果
                    .buttonStyle(PlainButtonStyle())
                    .padding(.top, 16)
                }
                Spacer()
            }
        }
    }
}

struct EnterThingBackgroundView: View {
    var body: some View {
        background(Color.white)
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
