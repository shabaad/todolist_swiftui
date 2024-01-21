//
//  todolist.swift
//  todolist
//
//  Created by Admin on 14/01/24.
//

import Foundation
import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel: TodoListViewModel
    @State private var showAddTodoView = false
    @State private var selectedTodoItem: TodoItem?
    @State private var showEditTodoView = false

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.items.isEmpty {
                    Text("No items in the list")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.items, id: \.self) { item in
                            NavigationLink(
                                destination: EditTodoView(item: item, viewModel: viewModel, isPresented: $showEditTodoView),
                                tag: item,
                                selection: $selectedTodoItem
                            ) {
                                Text(item.title)
                                    .onTapGesture {
                                        selectedTodoItem = item
                                        showEditTodoView.toggle()
                                    }
                            }
                        }
                        .onDelete(perform: viewModel.removeItem)
                    }
                    .padding()
                }

                Button(action: {
                    showAddTodoView.toggle()
                }) {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showAddTodoView) {
                    AddTodoView(viewModel: viewModel, isPresented: $showAddTodoView)
                }
            }
            .navigationBarTitle("To-Do List")
        }
    }
}
