# SwiftUI Essentials

A comprehensive SwiftUI component catalog showcasing 27+ SwiftUI components with interactive demos, built using Clean Architecture, MVVM-C pattern, and modern Swift 6 syntax.

![Swift Version](https://img.shields.io/badge/Swift-6.0+-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%2017.0+-lightgrey.svg)
![Architecture](https://img.shields.io/badge/Architecture-MVVM--C-blue.svg)

## 📱 Overview

SwiftUI Essentials is an interactive catalog that demonstrates:
- **27 SwiftUI Components** with live, interactive examples
- **Real-world use cases** (login forms, payment selectors, settings screens)
- **Dark/Light mode** automatic adaptation
- **Modern Swift 6** features (async/await, Sendable, MainActor)
- **Best practices** following Apple's design guidelines

## 🏗️ Architecture

This project implements **Clean Architecture** with the **MVVM-C** (Model-View-ViewModel-Coordinator) pattern, ensuring:
- Clear separation of concerns
- Testability and maintainability
- Adherence to SOLID principles
- Unidirectional data flow

### Architecture Layers

```
┌─────────────────────────────────────────────────┐
│           Presentation Layer (UI)               │
│  ┌─────────────────────────────────────────┐   │
│  │ Views (SwiftUI)                         │   │
│  │ - ComponentListView                     │   │
│  │ - ComponentDetailView                   │   │
│  │ - Demo Views                            │   │
│  └─────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────┐   │
│  │ ViewModels (@ObservableObject)          │   │
│  │ - ComponentListViewModel                │   │
│  │ - ComponentDetailViewModel              │   │
│  └─────────────────────────────────────────┘   │
└─────────────────────────────────────────────────┘
                      ↓
┌─────────────────────────────────────────────────┐
│            Domain Layer (Business Logic)        │
│  ┌─────────────────────────────────────────┐   │
│  │ Use Cases (Interactors)                 │   │
│  │ - FetchComponentsUseCase                │   │
│  └─────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────┐   │
│  │ Entities (Models)                       │   │
│  │ - ComponentItem                         │   │
│  │ - ComponentCategory                     │   │
│  └─────────────────────────────────────────┘   │
└─────────────────────────────────────────────────┘
                      ↓
┌─────────────────────────────────────────────────┐
│         Data Layer (Data Access)                │
│  ┌─────────────────────────────────────────┐   │
│  │ Repositories (Protocol)                 │   │
│  │ - ComponentRepositoryProtocol           │   │
│  │ - InMemoryComponentRepository           │   │
│  └─────────────────────────────────────────┘   │
└─────────────────────────────────────────────────┘
```

### Dependency Injection

The app uses a **DependencyContainer** to manage dependencies following the **Dependency Inversion Principle**:

```swift
@MainActor
public final class DependencyContainer {
    public static let shared = DependencyContainer()
    
    // Creates ViewModels with injected dependencies
    public func makeComponentListViewModel() -> ComponentListViewModel
    public func makeFetchComponentsUseCase() -> FetchComponentsUseCaseProtocol
}
```

## 📂 Project Structure

```
Essentials/
│
├── App/
│   ├── EssentialsApp.swift          # App entry point
│   ├── ContentView.swift            # Root view
│   └── DependencyContainer.swift    # Dependency injection
│
├── Domain/
│   ├── Entities/
│   │   └── ComponentModels.swift    # Domain models
│   └── UseCases/
│       └── ComponentUseCases.swift  # Business logic
│
├── Data/
│   └── Repositories/
│       └── ComponentRepository.swift # Data access
│
└── Presentation/
    ├── Scenes/
    │   ├── ComponentList/
    │   │   ├── ComponentListView.swift
    │   │   └── ComponentListViewModel.swift
    │   └── ComponentDetail/
    │       ├── ComponentDetailView.swift
    │       └── ComponentDetailViewModel.swift
    └── Components/
        └── Demos/
            ├── TextDemoView.swift
            ├── InputDemoView.swift
            ├── ButtonDemoView.swift
            ├── ControlDemoView.swift
            ├── GridDemoView.swift
            ├── LayoutDemoView.swift
            ├── LinkDemoView.swift
            ├── AttributedStringDemoView.swift
            └── IndicatorDemoView.swift
```

## ✨ Features

### Component Categories

#### 📝 Text & Inputs (6 components)
- **Text**: Font sizes, weights, colors
- **Label**: Icon-only, title-only, custom styles
- **TextField**: Username, email, phone with proper keyboard types
- **SecureField**: Password with show/hide toggle & strength indicator
- **TextEditor**: Multi-line text with character count
- **AttributedString**: Rich text with Markdown support

#### 🔘 Buttons & Controls (7 components)
- **Button**: Various styles (bordered, prominent, destructive)
- **Toggle**: Standard switches with custom tints
- **Slider**: Volume and brightness controls
- **Stepper**: Quantity and guest count
- **Picker**: Menu, segmented, inline styles
- **DatePicker**: Date and time selection
- **ColorPicker**: Theme color with preview

#### 📐 Layout & Containers (9 components)
- **VStack/HStack/ZStack**: Stack layouts
- **LazyVGrid/LazyHGrid**: Grid layouts with adjustable columns
- **ScrollView**: Horizontal and vertical scrolling
- **List**: Data presentation
- **Form**: Data entry screens
- **GroupBox**: Grouped content

#### 🧭 Navigation & Indicators (5 components)
- **NavigationStack**: Modern navigation
- **TabView**: Tabbed and paged views
- **Link**: URL navigation
- **ProgressView**: Loading and progress
- **Gauge**: Value visualization

### Real-World Examples

- 🔐 **Login/Signup Forms**: Complete with validation
- 💳 **Payment Method Selection**: Radio button style with icons
- 👕 **Size Selection**: Radio buttons for clothing sizes
- ⚙️ **Settings Screens**: Toggles, sliders, pickers
- 🔍 **Search Bars**: Properly styled search input
- 📝 **Profile Editing**: Bio editor with character count

### Dark/Light Mode Support

All components automatically adapt to the system color scheme using:
- `@Environment(\.colorScheme)` for dynamic theming
- System colors for automatic contrast adjustment
- Semantic colors for better accessibility

## 🛠️ Technology Stack

- **Language**: Swift 6.0+
- **Framework**: SwiftUI
- **Architecture**: MVVM-C / Clean Architecture
- **Concurrency**: async/await
- **State Management**: Combine + @Published
- **Minimum Deployment**: iOS 17.0+

## 📋 SOLID Principles

### Single Responsibility
- Each class/struct has one reason to change
- ViewModels handle presentation logic only
- Repositories handle data access only

### Open/Closed
- Extensible through protocols
- New components can be added without modifying existing code

### Dependency Inversion
- All dependencies injected via protocols
- ViewModels depend on abstractions (protocols), not concrete implementations

## 🚀 Getting Started

### Prerequisites
- Xcode 16.0+
- macOS 14.0+ (Sonoma)
- Swift 6.0+

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/SwiftUI-Essentials.git
cd SwiftUI-Essentials
```

2. Open the project:
```bash
open Essentials.xcodeproj
```

3. Build and run:
- Select a simulator or device
- Press `Cmd + R` to build and run

### Usage

1. **Browse Components**: View the categorized list of SwiftUI components
2. **Search**: Use the search bar to filter components
3. **Explore Details**: Tap any component to see interactive demos
4. **Interact**: Change settings and see live updates
5. **Toggle Dark Mode**: Switch between light/dark mode in Settings

## 📝 Code Standards

This project follows strict coding standards:

✅ **SwiftUI Best Practices**
- View bodies are pure functions
- No business logic in Views
- Proper use of @StateObject, @ObservedObject, @Published

✅ **Swift 6 Features**
- Sendable conformance for thread safety
- @MainActor annotation for ViewModels
- No force unwrapping (!)
- Async/await for asynchronous operations

✅ **Naming Conventions**
- UpperCamelCase for types
- camelCase for properties/methods
- MARK comments for organization

✅ **Memory Management**
- [weak self] in closures where needed
- Weak delegates to prevent retain cycles

## 🧪 Testing

*Coming soon: Unit tests for ViewModels and Use Cases*

## 📄 License

This project is available for educational and reference purposes.

## 👤 Author

Created following Apple's SwiftUI best practices and modern iOS development standards.

## 🙏 Acknowledgments

- Apple's SwiftUI Documentation
- Swift Evolution Proposals
- iOS Design Guidelines

---

**Built with ❤️ using SwiftUI and Clean Architecture**
