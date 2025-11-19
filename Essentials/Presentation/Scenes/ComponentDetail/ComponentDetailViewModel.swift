import Foundation
import Combine

@MainActor
public class ComponentDetailViewModel: ObservableObject {
    public let item: ComponentItem
    
    public init(item: ComponentItem) {
        self.item = item
    }
    
    // Add any specific detail logic here if needed in the future
}
