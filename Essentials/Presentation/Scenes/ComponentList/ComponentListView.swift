import SwiftUI
import Combine

struct ComponentListView: View {
    @StateObject private var viewModel: ComponentListViewModel
    
    init(viewModel: ComponentListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(ComponentCategory.allCases) { category in
                    if let items = viewModel.filteredComponents[category], !items.isEmpty {
                        Section(header: Text(category.rawValue)) {
                            ForEach(items) { item in
                                NavigationLink(value: item) {
                                    Label {
                                        VStack(alignment: .leading) {
                                            Text(item.name)
                                                .font(.headline)
                                            Text(item.description)
                                                .font(.caption)
                                                .foregroundStyle(.secondary)
                                        }
                                    } icon: {
                                        Image(systemName: item.systemImage)
                                            .foregroundStyle(.blue)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI Essentials")
            .searchable(text: $viewModel.searchText, prompt: "Search components")
            .navigationDestination(for: ComponentItem.self) { item in
                ComponentDetailView(item: item)
            }
            .task {
                await viewModel.loadComponents()
            }
        }
    }
}

#Preview {
    let repository = InMemoryComponentRepository()
    let useCase = FetchComponentsUseCase(repository: repository)
    let viewModel = ComponentListViewModel(fetchComponentsUseCase: useCase)
    return ComponentListView(viewModel: viewModel)
}
