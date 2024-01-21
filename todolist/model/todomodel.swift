//
//  todomodel.swift
//  todolist
//
//  Created by Admin on 14/01/24.
//

import Foundation
struct TodoItem: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String
}
