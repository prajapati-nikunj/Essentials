import Foundation

// MARK: - Component Repository Protocol
public protocol ComponentRepositoryProtocol: Sendable {
    func fetchComponents() async -> [ComponentItem]
}

// MARK: - In-Memory Component Repository
public struct InMemoryComponentRepository: ComponentRepositoryProtocol {
    
    public init() {}
    
    public func fetchComponents() async -> [ComponentItem] {
        // Simulate network delay if needed, but for local data it's instant
        return [
            // Text & Inputs
            ComponentItem(name: "Text", description: "A view that displays one or more lines of read-only text.", category: .textInputs, systemImage: "text.alignleft"),
            ComponentItem(name: "Label", description: "A standard label for user interface items, consisting of an icon with a title.", category: .textInputs, systemImage: "tag"),
            ComponentItem(name: "TextField", description: "A control that displays an editable text interface.", category: .textInputs, systemImage: "character.cursor.ibeam"),
            ComponentItem(name: "SecureField", description: "A control into which the user securely enters private text.", category: .textInputs, systemImage: "lock"),
            ComponentItem(name: "TextEditor", description: "A view that can display and edit long-form text.", category: .textInputs, systemImage: "doc.text"),
            ComponentItem(name: "AttributedString", description: "A string with associated attributes for rich text.", category: .textInputs, systemImage: "text.quote"),

            // Buttons & Controls
            ComponentItem(name: "Button", description: "A control that initiates an action.", category: .buttons, systemImage: "button.programmable"),
            ComponentItem(name: "Toggle", description: "A control that toggles between on and off states.", category: .buttons, systemImage: "switch.2"),
            ComponentItem(name: "Slider", description: "A control for selecting a value from a bounded linear range.", category: .buttons, systemImage: "slider.horizontal.3"),
            ComponentItem(name: "Stepper", description: "A control for incrementing and decrementing a value.", category: .buttons, systemImage: "plus.forwardslash.minus"),
            ComponentItem(name: "Picker", description: "A control for selecting from a set of mutually exclusive values.", category: .buttons, systemImage: "list.bullet"),
            ComponentItem(name: "DatePicker", description: "A control for selecting an absolute date.", category: .buttons, systemImage: "calendar"),
            ComponentItem(name: "ColorPicker", description: "A control used to select a color from the system color picker UI.", category: .buttons, systemImage: "paintpalette"),

            // Layout & Containers
            ComponentItem(name: "VStack", description: "A view that arranges its subviews in a vertical line.", category: .layout, systemImage: "square.split.1x2"),
            ComponentItem(name: "HStack", description: "A view that arranges its subviews in a horizontal line.", category: .layout, systemImage: "square.split.2x1"),
            ComponentItem(name: "ZStack", description: "A view that overlays its subviews, aligning them in both axes.", category: .layout, systemImage: "square.stack.3d.down.right"),
            ComponentItem(name: "LazyVGrid", description: "A container view that grows vertically, creating items only as needed.", category: .layout, systemImage: "square.grid.3x2"),
            ComponentItem(name: "LazyHGrid", description: "A container view that grows horizontally, creating items only as needed.", category: .layout, systemImage: "square.grid.2x2"),
            ComponentItem(name: "ScrollView", description: "A scrollable view.", category: .layout, systemImage: "scroll"),
            ComponentItem(name: "List", description: "A container that presents rows of data arranged in a single column.", category: .layout, systemImage: "list.bullet.rectangle"),
            ComponentItem(name: "Form", description: "A container for grouping controls used for data entry, such as in settings or inspectors.", category: .layout, systemImage: "list.clipboard"),
            ComponentItem(name: "GroupBox", description: "A stylized view, with an optional label, that visually collects a logical group of content.", category: .layout, systemImage: "rectangle.on.rectangle"),

            // Navigation
            ComponentItem(name: "NavigationStack", description: "A view that displays a root view and enables you to present additional views over the root view.", category: .navigation, systemImage: "sidebar.left"),
            ComponentItem(name: "TabView", description: "A view that switches between multiple child views using interactive user interface elements.", category: .navigation, systemImage: "rectangle.split.3x1"),
            ComponentItem(name: "Link", description: "A control for navigating to a URL.", category: .navigation, systemImage: "link"),

            // Indicators
            ComponentItem(name: "ProgressView", description: "A view that shows the progress of a task towards completion.", category: .indicators, systemImage: "hourglass"),
            ComponentItem(name: "Gauge", description: "A view that shows a value within a range.", category: .indicators, systemImage: "gauge"),
        ]
    }
}
