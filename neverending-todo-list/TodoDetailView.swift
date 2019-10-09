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

    var body: some View {
        VStack(alignment: .leading) {
            if todo.body != nil && !todo.body!.isEmpty {
                Text(todo.body!)
                    .font(.body)
            } else {
                Text("there's nothing here")
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
        /// Align the description to the top
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .navigationBarTitle(Text(todo.title))
            .navigationBarItems(
                trailing: Button(action: { self.toggleTodo() }) {
                    if !self.todo.completed {
                        Text("Complete")
                    } else {
                        Text("Discard")
                    }
                }
        )
    }

    func toggleTodo() {
        if let idx = todoStore.todoItems.firstIndex(where: { $0.id == self.todo.id }) {
            todoStore.todoItems[idx].completed = !todoStore.todoItems[idx].completed
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: defaultTodoItems[0], todoStore: TodoStore())
    }
}
