import SwiftUI

struct ComponentDetailView: View {
    @StateObject private var viewModel: ComponentDetailViewModel
    
    init(item: ComponentItem) {
        _viewModel = StateObject(wrappedValue: ComponentDetailViewModel(item: item))
    }
    
    var body: some View {
        // MARK: - Route to Appropriate Demo
        demoView(for: viewModel.item.name)
            .navigationTitle(viewModel.item.name)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Demo View Router
    @ViewBuilder
    private func demoView(for componentName: String) -> some View {
        switch componentName {
        // MARK: - Text & Inputs
        case "Text":
            TextDemoView()
        case "Label":
            LabelDemoView()
        case "TextField":
            TextFieldDemoView()
        case "SecureField":
            SecureFieldDemoView()
        case "TextEditor":
            TextEditorDemoView()
        case "AttributedString":
            AttributedStringDemoView()
            
        // MARK: - Buttons & Controls
        case "Button":
            ButtonDemoView()
        case "Toggle":
            ToggleDemoView()
        case "Slider":
            SliderDemoView()
        case "Stepper":
            StepperDemoView()
        case "Picker":
            PickerDemoView()
        case "DatePicker":
            DatePickerDemoView()
        case "ColorPicker":
            ColorPickerDemoView()
            
        // MARK: - Layout & Containers
        case "VStack", "HStack", "ZStack":
            LayoutDemoView()
        case "LazyVGrid", "LazyHGrid":
            GridDemoView()
        case "ScrollView", "List", "Form", "GroupBox":
            LayoutDemoView()
            
        // MARK: - Navigation
        case "Link":
            LinkDemoView()
        case "NavigationStack", "TabView":
            IndicatorDemoView()
            
        // MARK: - Indicators
        case "ProgressView":
            ProgressViewDemoView()
        case "Gauge":
            GaugeDemoView()
            
        default:
            ContentUnavailableView(
                "Demo Not Available",
                systemImage: "hammer",
                description: Text("This component demo has not been implemented yet.")
            )
        }
    }
}

#Preview {
    NavigationStack {
        ComponentDetailView(item: ComponentItem(name: "Text", description: "Demo", category: .textInputs, systemImage: "text.alignleft"))
    }
}
