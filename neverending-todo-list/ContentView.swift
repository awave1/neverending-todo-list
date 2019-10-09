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

    /// ContentView is out "main" view
    var body: some View {
        NavigationView {
            List {
                VStack {
                    /// So we added two `TextField`s to enter task title and body
                    /// But this could probably be moved out of here and reused
                    /// So, let's create a `CreateTodoItem` component
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

                ForEach(self.todos) { todo in
                    TodoItem(todo: todo)
                }
            }.navigationBarTitle(Text("todo 💯"))
        }
    }

    /// Callback function defining what will be done when user commits typing
    func createNewTodo() {
        if !self.newTaskTitle.isEmpty {
            let todo = Todo(title: newTaskTitle, body: newTaskBody, completed: false)
            self.todos.append(todo)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
