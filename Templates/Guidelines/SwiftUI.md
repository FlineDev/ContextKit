# SwiftUI Development Guidelines
<!-- Template Version: 12 | ContextKit: 0.2.0 | Updated: 2026-01-03 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues


## Overview

These guidelines provide strategic direction for SwiftUI development in ContextKit-managed projects. They focus on **what UI patterns to choose** during planning phases rather than detailed implementation.

---

## UI Framework Strategy

### SwiftUI First Approach
- ✅ **SwiftUI over UIKit**: For all new development and modern UI patterns
- ✅ **Plain SwiftUI**: Avoid complex architecture patterns, keep apps simple
- ✅ **Native Components**: Use system components over custom implementations
- ❌ **Avoid**: UIKit except for specific platform requirements
- ❌ **Avoid**: Complex MVVM or architectural patterns (use Models + @Environment services instead)

### State Management Strategy
- ✅ **`@Observable`**: For view state management (iOS 17+)
- ✅ **`@State`**: For local view state (toggles, text input, selection)
- ✅ **SwiftData**: For persistence with automatic UI updates
- ✅ **Environment**: For dependency injection and app-wide services
- ✅ **`@Entry`**: For custom environment values without boilerplate (Xcode 16+)
- ❌ **Avoid**: `@StateObject`/`@ObservableObject` for new development

---

## Liquid Glass Design Language (iOS 26+)

Liquid Glass is Apple's translucent material design system introduced across all platforms in iOS 26+ (WWDC 2025).

**API Usage:**
- ✅ **`.glassEffect()`**: Apply Liquid Glass material to custom views (defaults to capsule shape)
- ✅ **Automatic adoption**: System controls automatically use Liquid Glass when compiled with Xcode 26
- ❌ **Avoid**: Overusing glass effects on content-heavy views (can reduce readability)

---

## Modern SwiftUI Patterns

### View Organization Preferences
- ✅ **`@ViewBuilder` properties**: For non-reusable view components
- ✅ **In-type computed/functions properties**: When components used only within one parent
- ✅ **Separate View structs**: Only for truly reusable components across contexts
- ❌ **Avoid**: Creating separate views for single-use components

### Modern API Adoption
- ✅ **`#Preview`**: Use `#Preview` macro over `PreviewProvider` (Xcode 15+)
- ✅ **`@Previewable @State`**: For interactive previews (Xcode 16+)
- ✅ **`.rect()` shorthand**: For final shape calls over `RoundedRectangle()`
- ✅ **Built-in formatters**: `Text(value, format: .percent)` over manual formatting
- ✅ **Navigation Stack**: Over legacy `NavigationView` for iOS 16+

### Modern Logging Patterns
- ✅ **`Logger()`**: Use `Logger().info("message")` instead of `print()` (available via FlineDevKit)
- ✅ **Log levels**: `.info()`, `.debug()`, `.error()` for appropriate context
- ❌ **Avoid**: `print()` statements for logging

### Button and Interaction Patterns

**CRITICAL: Use Built-in Initializers for SF Symbols**

When creating buttons with text and SF Symbols, ALWAYS use the direct `systemImage:` parameter:

```swift
// ✅ CORRECT - Use built-in initializer
Button("Save", systemImage: "checkmark") { }

// ❌ WRONG - Don't manually create Label inside button
Button { } label: { Label("Save", systemImage: "checkmark") }
```

**Why this matters:**
- Simpler and more concise code
- Creates Label internally with proper accessibility
- Better adaptation in toolbars, menus, and containers
- Official Apple-documented pattern

**This applies to many SwiftUI views:**
- `Button`, `NavigationLink`, `Toggle`, `Picker`, and others support direct `systemImage:` parameters
- Always check if a view has a `systemImage:` initializer before manually creating `Label`

**Other Button Patterns:**
- ✅ **Trailing closure syntax**: `Button { action } label: { CustomView() }` for custom views
- ✅ **Text selection**: Enable for error messages and important content
- ✅ **Accessibility labels**: For all interactive elements
- ❌ **Avoid**: `action:` parameter style for buttons

---

## Color and Appearance Strategy

### Color System Preferences
- ✅ **SwiftUI system colors**: `.gray.opacity(0.1)` over UIKit wrapped colors
- ✅ **Semantic colors**: `.primary`, `.secondary`, `.accentColor`
- ✅ **Asset Catalog colors**: Add custom colors to Assets.xcassets, reference via generated symbols
- ✅ **Adaptive materials**: `.regularMaterial`, `.ultraThinMaterial`
- ❌ **Avoid**: `Color(.secondarySystemGroupedBackground)` and UIKit color wrapping

### Dark Mode and Accessibility
- ✅ **Automatic adaptation**: Use semantic colors that adapt to appearance
- ✅ **Dynamic Type support**: All text should scale with user preferences
- ✅ **High contrast**: Consider accessibility requirements in color choices
- ✅ **Platform conventions**: Follow HIG for color usage patterns

---

## Navigation Preferences

### Modern Navigation Patterns
- ✅ **NavigationStack**: For hierarchical navigation (iOS 16+)
- ✅ **NavigationSplitView**: For macOS and iPad split interfaces
- ✅ **Modal presentation**: `.sheet()` and `.fullScreenCover()` appropriately
- ❌ **Avoid**: Legacy `NavigationView` for new development

### Platform-Specific Navigation
- ✅ **iOS**: Stack-based navigation with clear hierarchy
- ✅ **macOS**: Split view with sidebar, content, and detail panes
- ✅ **Cross-platform**: Design for abundant horizontal space first

---

## Layout and Performance Strategy

### Layout Preferences
- ✅ **Frame alignment**: `.frame(maxHeight: .infinity, alignment: .bottom)`
- ✅ **Lazy loading**: `LazyVStack`/`LazyHStack` for large datasets
- ✅ **Composition**: Break complex views into focused components
- ❌ **Avoid**: `VStack + Spacer` when frame alignment is clearer

### Performance Considerations
- ✅ **Constants over functions**: `let cornerRadius: CGFloat = 12`
- ✅ **Multiplier constants**: For simple mathematical relationships
- ✅ **Extract expensive computations**: From view body calculations
- ❌ **Avoid**: Complex calculations directly in view builders

---

## Framework and Package Preferences

### FlineDev Ecosystem for SwiftUI
FlineDev frameworks provide SwiftUI-specific tools (find all at https://github.com/FlineDev):

**Auto-imported via `FlineDevKit`:**
- **`HandySwiftUI`**: SwiftUI tools for async states, UI components, styles, and common patterns
- **`TranslateKitSDK`**: 2000+ pre-localized common UI strings via TK.Action, TK.Label, TK.Message, etc.
- **`FreemiumKit`**: In-app purchases with native paywalls and subscription management

### HandySwiftUI Utilities

**New Types:**
- ✅ **Prefer**: `AsyncState<Error>` for async operation tracking with loading/success/failure states
- ✅ **Prefer**: `Platform.value()` for platform-specific values (iOS vs macOS vs visionOS)
- ✅ **Prefer**: `VPicker`/`HPicker` for vertical/horizontal picker layouts with custom styling
- ✅ **Prefer**: `Emoji` for type-safe emoji handling and random emoji generation

**View Modifiers:**
- ✅ **Prefer**: `.onFirstAppear { }` for one-time setup actions vs repeated onAppear calls

**Styles:**
- ✅ **Prefer**: `.primary()` and `.secondary()` button styles for consistent UI (HandySwiftUI)
- ✅ **Prefer**: `.checkboxUniversal` toggle style for cross-platform checkbox behavior (HandySwiftUI)
- ✅ **Prefer**: `.vertical()` labeled content style for form layouts (HandySwiftUI)

### Common UI Strings
- ✅ **Prefer**: `Button(TK.Action.save) { }` for common actions (TranslateKitSDK)
- ✅ **Prefer**: `Text(TK.Label.settings)` for common labels (TranslateKitSDK)

---

## Xcode Project Management

### Target and Project Configuration
- ✅ **Manual target creation**: Guide developers to create new targets manually through Xcode UI
- ✅ **Simple modifications**: Allow automated changes to Info.plist entries and known entitlements
- ✅ **Build settings**: Allow automated updates to straightforward build configuration settings
- ❌ **Avoid**: Direct .xcodeproj file editing for complex structural changes (targets, schemes, groups)
- ❌ **Avoid**: Automated target dependency management through project file modification

### Manual User Action Protocol
When Xcode UI actions are required, use the standardized user instruction format:
```
═══════════════════════════════════════════════════
║ 🎯 MANUAL XCODE ACTION REQUIRED
═══════════════════════════════════════════════════
║
║ [Clear step-by-step instructions for Xcode UI]
║ [Specific menu paths and button clicks]
║
║ Reply "Done" when completed to continue.
```

**Planning Integration**: Include manual Xcode actions as explicit steps in `Steps.md` implementation planning with clear user action markers.

### AI Testing Capabilities & Limitations

**What AI can validate automatically:**
- ✅ **Build validation**: Compile code, resolve build errors, check dependencies
- ✅ **Unit/integration tests**: Execute automated test suites and analyze results
- ✅ **Static code analysis**: Use ContextKit agents for pattern validation, accessibility code checks
- ✅ **File modifications**: Update Info.plist, privacy manifests, String Catalogs
- ✅ **Code quality**: ErrorKit patterns, modern API usage, architectural compliance

**What requires manual user testing:**
- 🧪 **Running app interactions**: Any task involving launching and using the actual app
- 🧪 **User experience validation**: Navigation flows, visual design, interaction feedback
- 🧪 **Device-specific testing**: Restart behavior, network conditions, multi-device scenarios
- 🧪 **All accessibility verification**: VoiceOver navigation, Dynamic Type scaling, contrast testing, real accessibility usage
- 🧪 **Performance validation**: Animation smoothness, memory usage, battery impact under real usage
- 🧪 **Integration testing**: Third-party services, in-app purchases, platform-specific features

**Implementation in Steps.md:**
- **Phase 5**: Automated integration (AI executes builds, tests, agents)
- **Phase 6**: Manual user testing (structured instructions with standardized response format)
- **Phase 7**: Release preparation (mix of automated file updates and manual external processes)

---

## Component Architecture

### Reusability Strategy
- ✅ **Universal components**: Work across iOS, macOS, and visionOS
- ✅ **ViewModifier patterns**: For consistent styling across components
- ✅ **Environment injection**: For shared services and configuration
- ✅ **Generic design**: Components that adapt to different contexts

### Component Hierarchy
- ✅ **Atomic components**: Small, focused, single-purpose
- ✅ **Composite views**: Combine atomic components meaningfully
- ✅ **Screen-level views**: Coordinate multiple composite views
- ❌ **Avoid**: Monolithic views mixing multiple concerns

---

## Development Philosophy

### Value-First Development
- ✅ **Core value first**: Build the minimal workflow that solves user problems
- ✅ **Risk-first milestones**: Tackle hardest, most uncertain parts first
- ✅ **Alpha-ready mindset**: Focus on complete, testable workflows quickly
- ❌ **Avoid**: Building infrastructure before proving core value

### Platform Priority Strategy
- ✅ **Primary platforms**: macOS, visionOS, iPadOS (abundant horizontal space)
- ✅ **Secondary platforms**: iPhone (optimize larger screens first, then adapt)
- ✅ **Horizontal-first design**: Utilize space effectively, minimize vertical stacking
- ✅ **Multi-platform from day 1**: Build components to work everywhere

### Implementation Approach
- ✅ **Universal component strategy**: Reusable across multiple contexts
- ✅ **Single concern milestones**: Each milestone focuses on one primary challenge
- ✅ **Validation-driven complexity**: Simple first, layer complexity iteratively
- ❌ **Avoid**: Screen-specific or feature-specific components early

---

## Error Handling and User Feedback

### ErrorKit Integration
- ✅ **User-friendly messages**: Use `ErrorKit.userFriendlyMessage(for: error)` for both system and custom errors
- ✅ **String interpolation**: Use `"Save failed: \(error)"` - automatic ErrorKit enhancement
- ✅ **Throwable errors**: Custom error types should conform to `Throwable` protocol
- ✅ **Typed throws**: Use `throws(SpecificError)` with `Catching` protocol for error nesting

### User Feedback Collection
- ✅ **Feedback buttons**: Use `.mailComposer()` modifier with `ErrorKit.logAttachment()`
- ✅ **Automatic log collection**: Include system logs from last 10-30 minutes for context via Logger()
- ✅ **Device context**: Include device model, iOS version, and app version in reports
- ✅ **Structured logging**: Use Logger() instead of print() for proper log collection

---

## Testing Strategy

### UI Testing Approach
- ✅ **Swift Testing**: Use Swift Testing framework (`@Test`, `#expect`) over XCTest for new unit tests
- ❌ **Avoid**: UI testing (unnecessary complexity and maintenance overhead)
- ❌ **Avoid**: Testing SwiftUI view hierarchies directly

### Focus Areas
- ✅ **Test ViewModels**: Business logic and state management
- ✅ **Test data transformations**: Model conversions and formatting logic
- ✅ **Test validation logic**: Input validation and error states

---

## Constitutional Principles

All SwiftUI development must support:

### Accessibility First
- Dynamic Type support in all UI text
- Semantic colors that adapt to system appearance
- VoiceOver labels and hints for interactive elements
- Keyboard navigation support

### Privacy by Design  
- Minimal data collection with explicit purpose
- Secure storage patterns (Keychain for sensitive data)
- Privacy manifest updates when needed
- No tracking and privacy-preserving analytics

### Localization Ready
- No hardcoded user-facing strings in model layer
- Use TranslateKitSDK for common UI strings: `TK.Action.save`, `TK.Label.settings`
- Generation of localization string comments for context (in String Catalog)
- Regional formatting for dates, numbers, currencies
- String Catalog integration (auto-added by Xcode upon builds)

### Platform Appropriate
- Follow Human Interface Guidelines
- Use system conventions and patterns
- Integrate properly with platform features
- Optimize for target platform screen size & UX

### Maintainability
- Prevent overly lengthy functions/views and split logically
- Prefer self-explaining code/components naming & structure over comments
- Comment only complex logic / calculations explaining the WHY
- Keep it simple wherever possible, avoiding boilerplate code

---

## Trusted Research Sources

### Apple Official Domains
- **developer.apple.com** - SwiftUI framework docs, tutorials, HIG, design resources, accessibility guidelines
- **SF Symbols, sample code, platform-specific guidelines, performance documentation**

### Community-Trusted Domains
- **wwdcnotes.com** - Community WWDC session summaries, especially SwiftUI-focused content
- **swiftui-lab.com** - Advanced SwiftUI techniques, performance insights, and deep technical analysis
- **hackingwithswift.com** - Practical SwiftUI tutorials, project-based learning, quick reference guides
- **avanderlee.com** - SwiftUI debugging, performance optimization, and practical development insights
- **swiftbysundell.com** - SwiftUI architecture patterns, best practices, and modern development approaches
- **swiftwithmajid.com** - SwiftUI development insights and comprehensive WWDC coverage
- **fatbobman.com** - SwiftUI and SwiftData technical analysis with detailed WWDC breakdowns
- **swiftwithvincent.com** - SwiftUI tutorials and developer-focused WWDC highlights
- **donnywals.com** - Practical SwiftUI guides and Apple platform development insights
- **kodeco.com** - Comprehensive SwiftUI tutorials and educational content
- **elkraneo.com** - SwiftUI development resources and WWDC session insights
- **natasharobot.com** - SwiftUI community perspectives and development experiences

### Indie Developer Perspectives
- **fline.dev** - Independent SwiftUI developer insights and real-world implementation experiences
- **Other established indie blogs** - Look for consistent SwiftUI content with practical examples

### Research Best Practices
- **Official First**: Start with developer.apple.com for authoritative guidance
- **Dual Search Strategy**: Use both WebSearch AND iosfeeds.com/archive search for SwiftUI community articles
- **iosfeeds.com Usage**: Search iosfeeds.com/archive?query=SwiftUI to find recent blog posts across the iOS community
- **Community Validation**: Cross-reference patterns across multiple trusted SwiftUI sources
- **Platform Considerations**: Check multiple sources for iOS/macOS/visionOS specific guidance
- **Domain-Limited Searches**: Use `site:wwdcnotes.com SwiftUI` for WWDC-specific content
- **WWDC Coverage**: Look for WWDC-specific SwiftUI coverage on active community blogs for latest API insights

---

## AI Target Membership Investigation & Repair

### Detecting Target Membership Issues from Build Errors

**Common Error Patterns Indicating Target Membership Problems**:

**"Cannot find type 'TypeName' in scope"**:
- Most common when source files aren't included in the building target
- Often occurs after AI creates new files or renames existing ones
- Type exists in codebase but isn't accessible to the failing target

**"No such module 'ModuleName'"**:
- Framework/dependency not linked to the target
- Module available to app target but not to extension targets
- Swift Package Manager modules not properly configured for all targets

**Duplicate symbol errors**:
- Same file accidentally included in multiple targets
- Shared code included when it should be target-specific

### Automated Target Membership Investigation

**Step 1: Parse Project Structure**
```bash
# Ensure cleanup of temporary files on exit
trap 'rm -f project.json' EXIT

# Convert pbxproj to readable format for analysis
plutil -convert json *.xcodeproj/project.pbxproj -o project.json

# Find all targets in the project
grep -E '"isa"\s*:\s*"PBXNativeTarget"' project.json -A 10

# Identify project uses modern File System Synchronized Groups (Xcode 16+)
grep -q "PBXFileSystemSynchronizedRootGroup" *.xcodeproj/project.pbxproj && echo "Modern sync groups detected"

# Clean up temporary file (trap ensures this happens even on script failure)
rm -f project.json
```

**Step 2: Analyze Target Membership for Failing Files**
```bash
# For modern Xcode 16+ projects with synchronized groups
# Check if file exists in membershipExceptions
FILE_PATH="Sources/Models/UserModel.swift"
grep -A 20 "PBXFileSystemSynchronizedBuildFileExceptionSet" *.xcodeproj/project.pbxproj | grep -q "$FILE_PATH"

# For legacy projects, check if file is in target's sources build phase
TARGET_NAME="WidgetExtension"
TARGET_ID=$(grep -B 2 -A 5 "name = $TARGET_NAME" *.xcodeproj/project.pbxproj | grep -o "[A-F0-9]\{24\}")
```

**Step 3: Identify Missing Dependencies**
```bash
# Check what frameworks/modules are linked to each target
grep -A 50 "\"$TARGET_ID\" /\* PBXFrameworksBuildPhase \*/" *.xcodeproj/project.pbxproj

# Compare import statements in failing files vs available modules
grep -h "^import " "$FILE_PATH" | sort | uniq
```

### Safe pbxproj Modification Strategy

**CRITICAL SAFETY PROTOCOL**: Always backup and validate immediately after any pbxproj modification:

```bash
# 1. Create backup before any changes
cp *.xcodeproj/project.pbxproj *.xcodeproj/project.pbxproj.backup

# 2. Make targeted modification (see specific fixes below)
# ... modification commands ...

# 3. IMMEDIATELY test project integrity
xcodebuild -list > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ pbxproj corrupted - reverting changes"
    mv *.xcodeproj/project.pbxproj.backup *.xcodeproj/project.pbxproj
    exit 1
fi

# 4. Test build for affected target
xcodebuild -scheme "$TARGET_NAME" -destination "platform=iOS Simulator,name=iPhone 15" build
if [ $? -ne 0 ]; then
    echo "⚠️ Build failed - analyzing errors before deciding on revert"
fi
```

### Fixing Target Membership Issues

**Modern Projects (Xcode 16+ with PBXFileSystemSynchronizedRootGroup)**:

Add file to additional target by creating membership exception:
```bash
# Find the target ID that needs the file
TARGET_ID=$(grep -B 2 -A 5 "name = $TARGET_NAME" *.xcodeproj/project.pbxproj | grep -o "[A-F0-9]\{24\}")

# Create or update PBXFileSystemSynchronizedBuildFileExceptionSet
# This requires careful text manipulation of the pbxproj file
# Use sed or awk to add the file path to membershipExceptions array

# Example structure to add:
# membershipExceptions = (
#     "Sources/Models/UserModel.swift",
# );
```

**Legacy Projects (Traditional PBXGroup structure)**:

Add file to target's sources build phase:
```bash
# Find sources build phase for target
SOURCES_PHASE_ID=$(grep -A 20 "\"$TARGET_ID\" /\* PBXSourcesBuildPhase \*/" *.xcodeproj/project.pbxproj | grep -o "[A-F0-9]\{24\}")

# Add file reference to the sources build phase files array
# This requires precise insertion into the files = ( ... ); section
```

### Validation and Rollback Protocol

**After Each Modification**:
1. **Immediate syntax check**: `xcodebuild -list` validates pbxproj structure
2. **Build test**: Attempt to build the affected target
3. **Error analysis**: If build fails, determine if it's the intended error fix or a new issue
4. **Rollback decision**: Revert if new errors introduced, keep if original error resolved

**Common pbxproj Corruption Signs**:
- `xcodebuild -list` returns error
- Xcode refuses to open project
- Missing target references
- Malformed object references

### Automated Investigation Workflow

```bash
# Complete investigation sequence for "Cannot find type" errors:

# Ensure cleanup of any temporary files
trap 'rm -f project.json target_analysis.tmp' EXIT

# 1. Identify the missing type and its source file
MISSING_TYPE="UserModel"
SOURCE_FILE=$(find . -name "*.swift" -exec grep -l "struct $MISSING_TYPE\|class $MISSING_TYPE\|enum $MISSING_TYPE" {} \;)

# 2. Check if source file exists in filesystem but not in failing target
if [ -f "$SOURCE_FILE" ]; then
    echo "✅ Source file exists: $SOURCE_FILE"

    # 3. Create temporary JSON for analysis
    plutil -convert json *.xcodeproj/project.pbxproj -o project.json

    # 4. Check current target membership
    RELATIVE_PATH=${SOURCE_FILE#./}
    grep -q "$RELATIVE_PATH" *.xcodeproj/project.pbxproj && echo "File referenced in pbxproj"

    # 5. Determine which targets include this file
    # ... target membership analysis using project.json ...

    # 6. Add to missing target if needed
    # ... safe modification with rollback ...

    # Cleanup handled by trap
else
    echo "❌ Source file missing from filesystem - different issue"
fi
```

### Best Practices for AI Target Membership Management

**Prevention Strategies**:
- ✅ **Template-based file creation**: When creating new shared files, use patterns that automatically include appropriate target membership
- ✅ **Post-creation validation**: Always build all targets after creating new files
- ✅ **Shared folder conventions**: Place truly shared code in `Shared/` folders with clear naming

**Repair Strategies**:
- ✅ **Conservative modifications**: Make minimal changes to pbxproj structure
- ✅ **Immediate validation**: Test every change before proceeding
- ✅ **Rollback readiness**: Keep backups and be prepared to revert
- ✅ **Target-specific analysis**: Understand why each target needs (or doesn't need) specific files

**Emergency Recovery**:
If pbxproj becomes corrupted and backups fail, the safest approach is to request manual user intervention:
```
═══════════════════════════════════════════════════
║ 🚨 PBXPROJ CORRUPTION DETECTED
═══════════════════════════════════════════════════
║
║ Automated target membership repair has corrupted the
║ project file. Manual intervention required:
║
║ 1. Restore from git: git checkout -- *.xcodeproj/project.pbxproj
║ 2. Or use Xcode to manually add [filename] to [target] target
║ 3. Check "Target Membership" in File Inspector
║
║ This prevents further damage to the project structure.
```

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