import Foundation

// MARK: - Fetch Components Use Case Protocol
public protocol FetchComponentsUseCaseProtocol: Sendable {
    func execute() async -> [ComponentItem]
}

// MARK: - Fetch Components Use Case Implementation
public struct FetchComponentsUseCase: FetchComponentsUseCaseProtocol {
    private let repository: ComponentRepositoryProtocol
    
    public init(repository: ComponentRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute() async -> [ComponentItem] {
        await repository.fetchComponents()
    }
}
