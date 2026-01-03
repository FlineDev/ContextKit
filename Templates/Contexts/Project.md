# Project Context Template
<!-- Template Version: 4 | ContextKit: 0.2.0 | Updated: 2026-01-03 -->

## Description
Project-level Context.md template providing project-specific investigation, development commands, project structure analysis, and ContextKit workflow configuration.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - PROJECT CONTEXT GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║ 
║ ### Phase 0: Check Customization
║ 
║ 0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
║    - Use `Grep` tool to find the start of the section
║    - Read everything below that line contained in this document til the end of the file
║    - Make sure to consider what was said there with high priority
║    - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"
║
║ ### Phase 1: Comprehensive Project Component Analysis
║
║ **CRITICAL**: This template execution should use the comprehensive findings from
║ the init.md Phase 3 investigation. Do not re-investigate - use provided findings!
║
║ 1. **Use Investigation Results from Init Phase**
║    - Component hierarchy and relationships (from init.md investigation)
║    - Validated build commands for each component (from init.md timeout testing)
║    - Validated test commands for each component (from init.md timeout testing)
║    - Dependencies and their purposes (from Package.swift/package.json analysis)
║    - File structure mappings (from init.md directory analysis)
║    - Code style patterns (from init.md source file analysis)
║    - Framework usage detection (from init.md import scanning)
║
║ 2. **Generate Component Overview Section**
║    - Create hierarchical component map similar to workspace format
║    - Show parent-child relationships between components
║    - Include for each: name, type, purpose, tech stack, file location
║    - Use emoji indicators: 📱 (app), 🖥️ (server), 📦 (package), 📚 (docs), 🔧 (tool)
║    - Format: Component Name (Type) - Purpose - Tech Stack - Location
║
║ 3. **Generate Detailed Component Sections**
║    For each component discovered, create detailed section with:
║    - **File Structure**: Actual directories and key files found
║    - **Dependencies**: Dependencies with purposes and providers from config files
║    - **Build Commands**: Validated commands from timeout testing (exact, not generic)
║    - **Test Commands**: Validated commands from timeout testing (exact, not generic)
║    - **Code Style**: Actual findings from formatter configs and source analysis
║    - **Framework Usage**: Import patterns detected from source code scanning
║
║ ### Phase 2: Workspace Integration & Standards
║
║ 4. **Apply Workspace Context** (if discovered by init.md)
║    - Use workspace inheritance information from init.md findings
║    - Apply workspace coding standards and architectural preferences
║    - Document workspace relationship and inheritance rules
║    - Note any workspace-level constitutional principle overrides
║
║ 5. **Constitutional Principles Integration**
║    - Apply core constitutional principles with workspace adjustments
║    - Document any workspace-level principle modifications
║    - Ensure principles are applied to all project components
║
║ ### Phase 3: Content Generation & Completion
║
║ 6. **Generate Project Context Content**
║    - Use `Edit` tool to replace this template with new structure:
║      A) Project Overview (basic project info and component count)
║      B) Component Architecture (hierarchical component map)
║      C) Detailed Component Sections (one per component with build/test commands)
║      D) Development Workflow (ContextKit integration)
║      E) Development Guidelines (with @ mentions for each copied guideline)
║      F) Constitutional Principles (applied with workspace inheritance)
║    - **CRITICAL**: All information must be based on init.md findings, not assumptions
║    - Include validated build/test commands for each component
║    - Document actual file structures and dependencies found
║    - **CRITICAL**: Add @ mention for EACH guideline that was copied to Context/Guidelines/
║      (Use Glob to check which .md files exist in Context/Guidelines/ and @ mention each)
║
║ 7. **Final Validation**
║    - Verify all information is based on actual init.md investigation results
║    - Confirm all build/test commands are validated and documented correctly
║    - Ensure component hierarchy matches actual project structure
║    - Check that workspace inheritance is properly documented
║    - Verify no placeholder content remains
║
║ 8. **COMPLETION**
║    - Use `Edit` tool to remove this entire boxed system instructions section
║    - Leave only the clean project context content for development use
║    - Final document enables immediate component-aware development
║
║ ## Success Criteria
║ - Complete component hierarchy with purpose and tech stack for each component
║ - Validated build/test commands documented for each component (exact, not generic)
║ - All information based on actual init.md investigation findings, not assumptions
║ - Component relationships and dependencies clearly mapped
║ - File structure documented for each component
║ - @ mentions added for ALL guidelines copied to Context/Guidelines/ (verified with Glob)
║ - Constitutional principles applied with workspace inheritance documented
║ - System instructions completely removed from final Context.md
║
════════════════════════════════════════════════════════════════════════════════

# Project Context: [Project Name from Investigation]

## Project Overview

- **Version**: [ContextKit Version from Templates]
- **Setup Date**: [Current Date]
- **Components**: [X] components discovered and analyzed
- **Workspace**: [Workspace Name from Investigation or "None (standalone project)"]
- **Primary Tech Stack**: [Most Common Language/Framework from Analysis]
- **Development Guidelines**: [List of copied guidelines based on project type detection]

## Component Architecture

**Project Structure**:

[Component Hierarchy from Investigation - Example Format:]
```
📁 [Project Name]
├── 📱 [App Component] ([Type]) - [Purpose from README] - [Tech Stack] - ./[path]
├── 🖥️ [Server Component] ([Type]) - [Purpose from README] - [Tech Stack] - ./[path]
├── 📦 [Package Component] ([Type]) - [Purpose from README] - [Tech Stack] - ./[path]
└── 📚 [Docs Component] ([Type]) - [Purpose from README] - [Tech Stack] - ./[path]
```

**Component Summary**:
- **[X] Swift components** - [Versions and frameworks found]
- **[Y] Other components** - [Languages and technologies found]
- **Dependencies**: [X] unique dependencies across components

---

## Component Details

### [Component Name 1] - [Type]

**Location**: `./[path]`
**Purpose**: [Purpose from README analysis]
**Tech Stack**: [Language], [Frameworks from investigation]

**File Structure**:
[Actual directory structure found:]
```
[Component]/
├── [key directories found]
├── [configuration files found]
└── [source directories found]
```

**Dependencies** (from [config file]):
[Key dependencies with purposes and providers found in config files]

**Development Commands**:
```bash
# Build (validated during setup)
[Exact command tested during init - with full path and parameters]

# Test (validated during setup)
[Exact command tested during init - with full path and parameters]

# Additional commands
[Other commands discovered for this component]
```

**Code Style** (detected):
[Actual code style findings from formatter configs and source analysis]

---

### [Component Name 2] - [Type]

[Repeat detailed section for each component found]

---

## Development Environment

**Requirements** (from analysis):
[Development environment requirements found in each component]

**Build Tools** (detected):
[Build tools and versions found across components]

**Formatters** (configured):
[Formatter configurations found and their settings]

## Development Guidelines

**Applied Guidelines**: [List guideline names that were copied, e.g., "Swift, SwiftUI"]

[For each guideline that was copied during setup, add @ mention on separate line:]
[If Swift.md was copied: @Context/Guidelines/Swift.md]
[If SwiftUI.md was copied: @Context/Guidelines/SwiftUI.md]
[Add other guidelines as applicable]

**Guidelines Integration**:
- Guidelines automatically loaded in full at chat start via @ mentions above
- All planning phases reference guidelines for architecture decisions
- Implementation phases apply guideline patterns and API preferences
- Quality agents validate against guideline requirements

## Constitutional Principles

**Core Principles**:
- ✅ Accessibility-first design (UI supports all assistive technologies)
- ✅ Privacy by design (minimal data collection, explicit consent)
- ✅ Localizability from day one (externalized strings, cultural adaptation)
- ✅ Code maintainability (readable, testable, documented code)
- ✅ Platform-appropriate UX (native conventions, platform guidelines)

**Workspace Inheritance**: [Workspace principle adjustments or "None - using global defaults"]

## ContextKit Workflow

**Systematic Feature Development**:
- `/ctxk:plan:1-spec` - Create business requirements specification (prompts interactively)
- `/ctxk:plan:2-research-tech` - Define technical research, architecture and implementation approach
- `/ctxk:plan:3-steps` - Break down into executable implementation tasks

**Development Execution**:
- `/ctxk:impl:start-working` - Continue development within feature branch (requires completed planning phases)
- `/ctxk:impl:commit-changes` - Auto-format code and commit with intelligent messages

**Quality Assurance**: Automated agents validate code quality during development
**Project Management**: All validated build/test commands documented above for immediate use

## Development Automation

**Quality Agents Available**:
- `build-project` - Execute builds with constitutional compliance validation
- `check-accessibility` - VoiceOver, contrast, keyboard navigation validation
- `check-localization` - String Catalog and cultural adaptation validation
- `check-error-handling` - ErrorKit patterns and typed throws validation
- `check-modern-code` - API modernization (Date.now, Duration, async/await)
- `check-code-debt` - Technical debt cleanup and AI artifact removal

## Configuration Hierarchy

**Inheritance**: [Workspace Context] → **This Project**

**This Project Inherits From**:
- **Workspace**: [Workspace name and standards or "None (standalone project)"]
- **Project**: Component-specific configurations documented above

**Override Precedence**: Project component settings override workspace settings

---
*Generated by ContextKit with comprehensive component analysis. Manual edits preserved during updates.*