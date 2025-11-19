import Foundation

// MARK: - Dependency Container
/// Container responsible for creating and managing dependencies following the Dependency Inversion Principle.
/// This ensures proper separation of concerns and makes testing easier.
@MainActor
public final class DependencyContainer {
    
    // MARK: - Singleton
    public static let shared = DependencyContainer()
    
    // MARK: - Repositories
    private lazy var componentRepository: ComponentRepositoryProtocol = {
        InMemoryComponentRepository()
    }()
    
    // MARK: - Use Cases
    public func makeFetchComponentsUseCase() -> FetchComponentsUseCaseProtocol {
        FetchComponentsUseCase(repository: componentRepository)
    }
    
    // MARK: - View Models
    public func makeComponentListViewModel() -> ComponentListViewModel {
        ComponentListViewModel(fetchComponentsUseCase: makeFetchComponentsUseCase())
    }
    
    public func makeComponentDetailViewModel(item: ComponentItem) -> ComponentDetailViewModel {
        ComponentDetailViewModel(item: item)
    }
    
    private init() {}
}
