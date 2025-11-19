import Foundation

// MARK: - Component Category
public enum ComponentCategory: String, CaseIterable, Identifiable, Sendable {
    case textInputs = "Text & Inputs"
    case buttons = "Buttons & Controls"
    case layout = "Layout & Containers"
    case navigation = "Navigation"
    case indicators = "Indicators"
    
    public var id: String { rawValue }
}

// MARK: - Component Item
public struct ComponentItem: Identifiable, Hashable, Sendable {
    public let id: UUID
    public let name: String
    public let description: String
    public let category: ComponentCategory
    public let systemImage: String
    
    public init(
        id: UUID = UUID(),
        name: String,
        description: String,
        category: ComponentCategory,
        systemImage: String
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.category = category
        self.systemImage = systemImage
    }
}
