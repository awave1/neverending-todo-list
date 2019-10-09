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
        .navigationBarItems(trailing: Button("✓", action: { }))
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: defaultTodoItems[0])
    }
}
