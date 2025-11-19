//
//  ContentView.swift
//  Essentials
//


import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DependencyContainer.shared.makeComponentListViewModel()
    
    var body: some View {
        ComponentListView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
