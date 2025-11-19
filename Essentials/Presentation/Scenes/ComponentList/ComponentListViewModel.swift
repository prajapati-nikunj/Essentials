import Foundation
import Combine

@MainActor
public class ComponentListViewModel: ObservableObject {
    
    @Published public var components: [ComponentItem] = []
    @Published public var searchText: String = ""
    
    private let fetchComponentsUseCase: FetchComponentsUseCaseProtocol
    
    public init(fetchComponentsUseCase: FetchComponentsUseCaseProtocol) {
        self.fetchComponentsUseCase = fetchComponentsUseCase
    }
    
    public func loadComponents() async {
        let allComponents = await fetchComponentsUseCase.execute()
        self.components = allComponents
    }
    
    public var filteredComponents: [ComponentCategory: [ComponentItem]] {
        let filtered = searchText.isEmpty ? components : components.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        return Dictionary(grouping: filtered, by: { $0.category })
    }
}
