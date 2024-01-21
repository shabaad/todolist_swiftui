//
//  viewmodel.swift
//  todolist
//
//  Created by Admin on 14/01/24.
//

import Foundation
class TodoListViewModel: ObservableObject {
    @Published var items: [TodoItem] = [] {
        didSet {
            saveItems()
        }
    }
    
    init() {
        loadItems()
    }
    
    func addItem(title: String) {
        let newItem = TodoItem(title: title)
        items.append(newItem)
    }
    
    func removeItem(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func updateItem(at index: Int, withTitle title: String) {
        items[index].title = title
    }
    
    private func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "todoItems")
        }
    }
    
    private func loadItems() {
        if let data = UserDefaults.standard.data(forKey: "todoItems") {
            if let decodedItems = try? JSONDecoder().decode([TodoItem].self, from: data) {
                items = decodedItems
            }
        }
    }
}
