//
//  addview.swift
//  todolist
//
//  Created by Admin on 14/01/24.
//

import Foundation
import SwiftUI

struct EditTodoView: View {
    var item: TodoItem
    @ObservedObject var viewModel: TodoListViewModel
    @Binding var isPresented: Bool
    @State private var editedTitle: String
    
    init(item: TodoItem, viewModel: TodoListViewModel, isPresented: Binding<Bool>) {
        self.item = item
        self.viewModel = viewModel
        self._isPresented = isPresented
        self._editedTitle = State(initialValue: item.title)
    }
    
    var body: some View {
        VStack {
            TextField("Edit Item", text: $editedTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Save") {
                viewModel.updateItem(at: viewModel.items.firstIndex(of: item)!, withTitle: editedTitle)
                isPresented.toggle()
            }
            .padding()
        }
        .navigationBarTitle("Edit Todo Item")
    }
}
