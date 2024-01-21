//
//  ContentView.swift
//  todolist
//
//  Created by Admin on 14/01/24.
//

import SwiftUI

struct ContentView: View {
     let viewModel = TodoListViewModel()
    var body: some View {
        TodoListView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
