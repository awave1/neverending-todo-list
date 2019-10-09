//
//  TodoDetailView.swift
//  neverending-todo-list
//
//  Created by awave on 2019-10-08.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct TodoDetailView: View {
    var todo: Todo

    @ObservedObject var todoStore: TodoStore
    @State var editing: Bool = false
    @State var newBody: String = ""
    @State var newTitle: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            if (!self.editing) {
                if todo.body != nil && !todo.body!.isEmpty {
                    Text(todo.body!)
                        .font(.body)
                } else {
                    Text("there's nothing here")
                        .font(.body)
                        .foregroundColor(.gray)
                }
            } else {
                TextField("new title...", text: $newTitle)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)

                TextField("new body...", text: $newBody)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }

            Spacer()

            Button(action: { self.toggleTodo() }) {
                HStack {
                    Spacer()
                    Text(self.todo.completed ? "✅" : "⬜️").font(.largeTitle)
                    Spacer()
                }
            }.padding()
        }
        /// Align the description to the top
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .navigationBarTitle(Text(newTitle))
        .navigationBarItems(
            trailing: Button(action: { self.edit() }) {
                if self.editing {
                    Text("Done").bold()
                } else {
                    Text("Edit")
                }
            }
        )
        .onAppear(perform: {
            /// Set newTitle and newBody to current body and title
            self.newTitle = self.todo.title
            if let body = self.todo.body {
                self.newBody = body
            }
        })
        .animation(.easeInOut)
    }

    func toggleTodo() {
        if let idx = todoStore.todoItems.firstIndex(where: { $0 == self.todo }) {
            todoStore.todoItems[idx].completed = !todoStore.todoItems[idx].completed
        }
    }

    func edit() {
        self.editing.toggle()

        if !self.editing {
            if let idx = todoStore.todoItems.firstIndex(where: { $0 == self.todo }) {
                todoStore.todoItems[idx].body = self.newBody
            }
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: defaultTodoItems[0], todoStore: TodoStore())
    }
}
