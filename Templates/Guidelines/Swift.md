# Swift Development Guidelines
<!-- Template Version: 5 | ContextKit: 0.2.0 | Updated: 2026-01-03 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Overview

These guidelines provide strategic direction for Swift development in ContextKit-managed projects. They focus on **what to choose** during planning phases rather than detailed implementation patterns.

---

## Modern API Preferences

### Temporal APIs
- ✅ **Prefer**: `Date.now` over `Date()`
- ✅ **Prefer**: `Duration` over `TimeInterval`
- ✅ **Prefer**: `ContinuousClock.now` for timing measurements
- ✅ **Prefer**: `Logger().debug/info/warnings/error` over `print` for logging/debugging messages

### Language Features
- ✅ **Prefer**: Switch expressions over switch statements
- ✅ **Prefer**: `if` expressions for conditional assignment
- ✅ **Prefer**: `replacing()` over `replacingOccurrences(of:with:)`
- ✅ **Prefer**: Modern collection algorithms over imperative loops
- ✅ **Prefer**: Modern shorthand: `[if/guard] let value else {}` over `[if/guard] let value = self.value else {}`

### String/Data Conversion
- ✅ **Prefer**: `Data(string.utf8)` for String to Data conversion (non-optional)
- ✅ **Prefer**: `String(decoding: data, as: UTF8.self)` for Data to String conversion (non-optional, replaces invalid bytes with �)
- ❌ **Avoid**: `string.data(using: .utf8)` (returns optional)
- ❌ **Avoid**: `String(data: data, encoding: .utf8)` (returns optional)

### Concurrency
- ✅ **Prefer**: `async/await` over completion handlers
- ✅ **Prefer**: Structured concurrency (`TaskGroup`, `async let`)
- ❌ **Avoid**: Manual thread management
- ❌ **Avoid**: Nested completion handler callbacks

---

## Architecture Preferences

### UI Framework Choice
- ✅ **SwiftUI first**: For new development and modern UI patterns
- ✅ **MVVM patterns**: With `@Observable` view models or services
- ❌ **Avoid**: UIKit except for specific platform requirements
- ❌ **Avoid**: UIViewRepresentable unless absolutely necessary

### Error Handling Strategy
- ✅ **Typed throws**: Use `throws(SpecificError)` for better error handling
- ✅ **ErrorKit patterns**: For user-friendly error messages and chains
- ✅ **Early returns**: Use `guard` statements for preconditions
- ❌ **Avoid**: Generic `Error` types when specific errors are known

---

## Framework and Package Preferences

### FlineDev Ecosystem Overview
FlineDev frameworks provide a cohesive development experience (find all at https://github.com/FlineDev):

**Auto-imported via `FlineDevKit`:**
- **`ErrorKit`**: Enhanced error handling with typed throws, user-friendly messages, and error chain debugging
- **`HandySwift`**: Essential utilities missing from Foundation (RESTClient, Debouncer, date/time types)
- **`TranslateKitSDK`**: 2000+ pre-localized common UI strings via TK.Action, TK.Label, TK.Message, etc.
- **`TelemetryDeck`**: Privacy-preserving analytics and app insights

**Additional frameworks (manual import needed):**
- **`IntelligenceKit`**: OpenAI GPT integration with structured responses and error handling - add to Package.swift and import separately when needed for AI features

### Import Strategy
- ✅ **Primary**: Always import `FlineDevKit` first in new files
- ✅ **Selective**: Only import additional frameworks when FlineDevKit insufficient

### Networking
- ✅ **Prefer**: `RESTClient` from HandySwift for REST APIs
- ✅ **Prefer**: `IntelligenceKit` for AI service integration (OpenAI, etc.)
- ❌ **Avoid**: Custom URLSession implementations
- ❌ **Avoid**: Manual JSON parsing when structured solutions exist

### HandySwift Utilities

**New Types:**
- ✅ **Prefer**: `Debouncer` for input throttling and preventing rapid-fire operations
- ✅ **Prefer**: `GregorianDay/GregorianTime` for date/time-only storage without timezone confusion

**String Extensions:**
- ✅ **Prefer**: `.isBlank` for checking empty or whitespace-only strings

**Numeric Extensions:**
- ✅ **Prefer**: `5.times { }`/`5.timesMake { }` for clean fixed times repetition/creation

### Common UI Strings
- ✅ **Prefer**: `Button(TK.Action.save) { }` for common actions (TranslateKitSDK)
- ✅ **Prefer**: `Text(TK.Label.settings)` for common labels (TranslateKitSDK)

### Testing Strategy
- ✅ **Swift Testing**: Use Swift Testing framework (`@Test`, `#expect`) over XCTest for new unit tests
- ✅ **Minimal testing**: Only for complex algorithms with many edge cases
- ❌ **Avoid**: Testing simple CRUD operations

---

## Code Style Essentials

### Formatting Standards
- **3-space indentation** (enforced by formatters)
- **Trailing commas** in multi-line collections
- **No header comments** or file-level documentation
- **No MARK sections** - use separate files instead

### Self Usage
- ✅ **Always use `self.`** for property access
- ✅ **Consistent pattern**: Makes property references explicit

### Naming Conventions
- ✅ **Descriptive names**: Clarity over brevity
- ✅ **Collection literals**: `var items: [Type] = []` over `Array<Type>()`
- ❌ **Avoid**: Redundant type information in method names

---

## Project Organization Patterns

### Directory Structure
```
App/
├── Sources/
│   ├── Models/        # Data models and core types
│   ├── Views/         # SwiftUI components
│   ├── Extensions/    # Type extensions (*Ext.swift)
│   └── Global/        # Shared utilities and constants
└── Resources/
    ├── Assets.xcassets       # Images, colors, app icons
    ├── Info.plist           # App configuration
    ├── PrivacyInfo.xcprivacy # Privacy manifest
    └── App.entitlements     # Capabilities and permissions
Tests/
└── Sources/
    ├── Models/        # Unit tests for data models
    ├── Extensions/    # Test extensions and utilities
    └── Global/        # Shared test utilities and helpers
```

### File Organization
- **One primary type per file** for substantial types (>10 lines)
- **Extensions in Extensions/ folder** with `TypeNameExt.swift` pattern
- **Related small types together** when closely coupled

### Build Configuration
- **Standard scheme**: `App` for all projects
- **Build command**: `xcodebuild -scheme App build -quiet`
- **Formatter sequence**: SwiftFormat first, then swift-format

---

## Quality Assurance Integration

### Automated Formatting
- **Dual formatters**: SwiftFormat (self insertion) + swift-format (general formatting)
- **Execution order**: SwiftFormat first, swift-format last
- **Required timing**: Before commits, after milestones, after successful builds

### Code Quality Gates
Quality validation is handled by specialized agents:
- **`check-modern-code`**: Validates modern API usage
- **`check-accessibility`**: Ensures accessibility compliance
- **`check-localization`**: Verifies string externalization
- **`check-error-handling`**: Confirms ErrorKit patterns
- **`check-code-debt`**: Removes AI artifacts and cleans up code

---

## Apple Platform Versioning

### Unified Version Numbering (2025+)

Starting with releases in September 2025, Apple unified version numbering across **all platforms**:

**Year-Aligned Versioning Scheme:**
- **WWDC 2025** (June 9, 2025) → **Version 26** releases (September 15, 2025)
- Version number = WWDC year + 1
- All platforms share the same major version number

**Platform Version Alignment:**
```
Previous Scheme (2024):          Unified Scheme (2025+):
├─ iOS 18.x                     ├─ iOS 26.x
├─ iPadOS 18.x                  ├─ iPadOS 26.x
├─ macOS 15.x (Sequoia)         ├─ macOS 26.x (Tahoe)
├─ watchOS 11.x                 ├─ watchOS 26.x
├─ tvOS 18.x                    ├─ tvOS 26.x
└─ visionOS 2.x                 └─ visionOS 26.x
```

---

## Official Apple Resources

### Swift Language Documentation
- **Swift Language Guide**: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/
- **Swift API Design Guidelines**: https://swift.org/documentation/api-design-guidelines/
- **Swift Evolution**: https://apple.github.io/swift-evolution/ - Track upcoming language features
- **Swift Package Manager**: https://swift.org/getting-started/#using-the-package-manager

### Apple Developer Documentation
- **Foundation Framework**: https://developer.apple.com/documentation/foundation
- **Swift Concurrency**: https://developer.apple.com/documentation/swift/concurrency
- **Testing in Xcode**: https://developer.apple.com/documentation/xcode/testing-your-apps-in-xcode
- **App Store Connect**: https://developer.apple.com/documentation/appstoreconnectapi

### Community-Trusted Domains
- **wwdcnotes.com** - Community WWDC session summaries with practical examples
- **swiftbysundell.com** - Modern Swift patterns, best practices, and architectural guidance
- **avanderlee.com** - Practical iOS development, debugging, and performance insights
- **hackingwithswift.com** - Swift tutorials, project-based learning, and reference materials
- **swiftwithmajid.com** - SwiftUI and iOS development insights with regular WWDC coverage
- **fatbobman.com** - In-depth Swift and SwiftData analysis with WWDC technical breakdowns
- **swiftwithvincent.com** - Swift development tutorials and WWDC highlights
- **donnywals.com** - Practical iOS development guides and Apple platform updates
- **kodeco.com** - Comprehensive iOS tutorials and WWDC recaps (formerly Ray Wenderlich)
- **elkraneo.com** - WWDC session resources and practical development insights
- **natasharobot.com** - Swift community insights and development practices
- **pointfree.co** - Advanced Swift concepts, functional programming, and architecture

### Performance and Debugging
- **Xcode Instruments**: https://developer.apple.com/documentation/instruments
- **Swift Performance**: https://github.com/apple/swift/blob/main/docs/OptimizationTips.rst
- **Memory Management**: https://developer.apple.com/documentation/swift/automaticreferencecounting

---

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Instructions

<!-- Add project-specific guidance here -->

## Additional Examples

<!-- Add examples specific to your project here -->

## Override Behaviors

<!-- Document any project-specific overrides here -->