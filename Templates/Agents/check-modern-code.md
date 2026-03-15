---
meta: "Template Version: 7 | ContextKit: 0.2.0 | Updated: 2024-11-05"
name: check-modern-code
description: [INCOMPLETE] Detect and replace outdated APIs with modern alternatives - needs rework for read-only reporting
tools: [Read, Edit, MultiEdit, Grep, Glob, Bash, Task]
color: cyan
---

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

# Agent: check-modern-code

## Purpose
Detect and automatically replace outdated APIs, patterns, and language constructs with modern alternatives that improve readability, performance, and maintainability.

## Context Requirements
- Project Context.md file for understanding project type, architecture, and technology stack
- Source code files appropriate for the detected project type
- Target platform and version information from project context

## Recent Work Input Format

When called with targeted analysis, agents receive specific files and ranges:

```
FILES:
- Sources/Services/AuthService.swift:23-89,145-201
- Sources/Models/User.swift:45-78
- Sources/Views/LoginView.swift
```

**Structure Interpretation**:
- **File path**: Relative to project root
- **Line ranges**: `45-78` = lines 45 through 78
- **Multiple ranges**: `23-89,145-201` = lines 23-89 AND lines 145-201
- **No ranges**: Analyze entire file (new files or completely rewritten)
- **Analysis scope**: Focus ONLY on specified files and ranges, ignore rest of codebase

## Execution Flow (agent)
0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
   - Use `Grep` tool to find the start of the section
   - Read everything below that line contained in this document til the end of the file
   - Make sure to consider what was said there with high priority
   - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"

1. **Read Project Context**
   → Use Read to examine Context.md file in project root
   → Extract project type, tech stack, target versions, and architectural patterns
   → If Context.md missing: proceed with auto-detection based on file structure

2. **Scan Specified Source Files**
   → **If FILES provided**: Use Read to examine only specified files and line ranges
   → **If no FILES provided**:
     - WARN "No FILES specified - scanning uncommitted changes instead"
     - WARN "Run code modernization checks during feature development for targeted analysis"
     - Use Bash to get uncommitted files: `git diff --name-only HEAD`
     - If git not available: ERROR "Git repository required for automatic file detection"
     - If no uncommitted files: INFO "No uncommitted changes found - nothing to analyze"
     - Filter for source files based on project context (.swift, .js, .py, .rb, etc.)
     - Use Read to examine uncommitted source files only
   → Apply modernization concepts only to specified areas when FILES format is used
   → If no source files found: ERROR "No source files to analyze"

3. **Apply Modernization Analysis and Automatic Fixes**
   → Use universal modernization concepts below adapted to project language/framework
   → Read source files and identify outdated patterns through intelligent code analysis
   → Use Edit/MultiEdit tools to automatically replace outdated patterns with modern alternatives
   → Apply safe modernization fixes (deprecated APIs, simple pattern replacements)

4. **Validate Build After Changes**
   → Use Task tool to launch `build-project` agent: "Verify project builds after modernization fixes"
   → If build fails: Use Edit/MultiEdit to fix compilation errors caused by API changes
   → If build fails repeatedly: Revert problematic changes and report build issues
   → Continue only if build succeeds

5. **Generate Fix Summary Report**
   → Document all automatic modernization fixes applied with before/after examples
   → Report any patterns requiring manual intervention (complex async migrations, architectural changes)
   → Include modernization concept labels for educational value
   → Include build validation status in the report
   → Return: SUCCESS (modernization fixes applied and verified) or ERROR (with specific guidance)

## Universal Modernization Concepts
Apply these modernization principles to any programming language:

### API Evolution - Use Latest Standard APIs
Replace deprecated or outdated APIs with current standard library alternatives.

**Swift Example**:
- **Pattern**: `Date()`
- **Detection**: Read source files and identify direct Date() instantiation for current timestamps
- **Modern**: `Date.now`

### Type Safety Improvements - Prefer Type-Safe APIs
Replace primitive types with domain-specific types that provide better type safety.

**Swift Example**:
- **Pattern**: `TimeInterval` (just a Double alias)
- **Detection**: Read source files and identify TimeInterval usage for duration measurements
- **Modern**: `Duration` API (structured time representation)

### Method Simplification - Use Simpler Method Names
Replace verbose method names with cleaner, more intuitive alternatives.

**Swift Example**:
- **Pattern**: `replacingOccurrences(of:with:)`
- **Detection**: Read source files and identify verbose string replacement method calls
- **Modern**: `replacing(_:with:)`

### Control Flow Modernization - Use Expression-Based Logic
Replace verbose conditional chains with modern expression-based alternatives.

**Swift Example**:
- **Pattern**: Complex if-let chains with multiple returns
- **Detection**: Read source files and identify nested conditional patterns with multiple return statements
- **Modern**: Switch expressions with pattern matching

### Async Pattern Updates - Use Native Async Constructs
Replace callback-based async patterns with language-native async constructs.

**Swift Example**:
- **Pattern**: Completion handler closures
- **Detection**: Read source files and identify callback-based async patterns with completion handlers
- **Modern**: `async throws` functions

### Framework Integration - Use Direct Framework APIs
Replace bridge patterns with direct framework integrations.

**Swift Example**:
- **Pattern**: `UIViewRepresentable`, `UIViewControllerRepresentable`
- **Detection**: Read source files and identify UIKit bridge patterns in SwiftUI code
- **Modern**: Pure SwiftUI implementations

## Output Format

```markdown
✅ MODERNIZATION FIXES APPLIED

Fixed 6 deprecated APIs, 3 pattern updates across 5 files
Build validated: SUCCESS

Manual review needed:
- NetworkManager.swift:128 - Complex async migration (evaluate async/await)
- CustomViewController.swift - UIKit bridge evaluation (consider pure SwiftUI)

Files modified: UserService.swift, TextProcessor.swift, ValidationLogic.swift
```


## Modernization Application
The universal concepts above can be applied to any programming language. The SwiftUI examples demonstrate how these principles work in practice and can guide similar modernizations in other frameworks and languages.

## Error Conditions
- **No source files found**: "No source code files available for modernization analysis"
- **Pattern detection failed**: "Unable to scan files for outdated patterns in detected language"
- **Language not supported**: "Modernization patterns not defined for detected language [language]"

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