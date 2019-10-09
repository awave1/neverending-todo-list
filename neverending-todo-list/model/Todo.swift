//
//  Todo.swift
//  neverending-todo-list
//
//  Created by awave on 2019-10-08.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

// MARK: - TodoItem
struct Todo: Codable, Identifiable, Equatable, Hashable {
    let id: UUID
    var title: String
    var body: String?
    var completed: Bool

    init(title: String, body: String?, completed: Bool) {
        self.id = UUID()
        self.title = title
        self.completed = completed
        self.body = body
    }
}
