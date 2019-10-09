//
//  ContentView.swift
//  neverending-todo-list
//
//  Created by awave on 2019-10-08.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    /// State variable, indicating if user is editing the todo list
    @State var isEditing: Bool = false
    @State var newTaskTitle: String = ""
    @State var newTaskBody: String = ""
    @State var todos: [Todo] = defaultTodoItems

    @ObservedObject var todoStore = TodoStore()

    /// ContentView is out "main" view
    var body: some View {
        NavigationView {
            List {
                VStack {
                    TextField(
                        "So, what's next...✏️",
                        text: $newTaskTitle,
                        onEditingChanged: { changed in print("changed title: \(changed)")},
                        onCommit: { print("commit title") }
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField(
                        "Give your task more detail...",
                        text: $newTaskBody,
                        onEditingChanged: { changed in print("changed body: \(changed)") },
                        onCommit: { print("commit body") }
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Create new", action: { self.createNewTodo() })
                        .foregroundColor(.blue)
                }

                ForEach(todoStore.todoItems) { todo in
                    /// So now that we have navigation, let's add todo item detail view
                    NavigationLink(destination: TodoDetailView(todo: todo, todoStore: self.todoStore)) {
                        TodoItem(todo: todo)
                    }
                }
            }.navigationBarTitle(Text("todo 💯"))
        }
    }

    /// Callback function defining what will be done when user commits typing
    func createNewTodo() {
        if !self.newTaskTitle.isEmpty {
            let todo = Todo(title: newTaskTitle, body: newTaskBody, completed: false)
            self.todoStore.todoItems.append(todo)

            newTaskTitle = ""
            newTaskBody = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
