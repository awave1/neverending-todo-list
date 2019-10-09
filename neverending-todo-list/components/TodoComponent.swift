//
//  TodoComponent.swift
//  neverending-todo-list
//
//  Created by awave on 2019-10-08.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct TodoItem: View {
    /// Associate Todo model structure with the TodoItem component
    var todo: Todo

    var body: some View {
        /// Let's Build the view!
        HStack {
            /// Stack the title and body vertically
            /// using VStack and align it to the left
            VStack(alignment: .leading) {

                /// Define text styling declaratively
                Text(todo.title)
                    .bold()

                /// Don't add the text if it's `nil`
                if todo.body != nil {
                    Text(todo.body!)
                        .font(.subheadline)
                }
            }

            /// make sure that checkboxes are at the end
            Spacer()

            if todo.completed {
                Text("✅")
            } else {
                Image(systemName: "square")
            }
        }
    }
}

/// This struct is used to display the compoenent on Canvas
struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        /// To make it more dynamic, let's iterate through `todoItems` and add
        /// all of the existing `Todo` items
        List(todoItems) { todo in
            TodoItem(todo: todo)
        }
    }
}
