# ContextKit Repository Development Guide

## 🚨 CRITICAL: Meta-Development Context

**You are working ON ContextKit, not WITH ContextKit!**

This repository contains **TEMPLATES and INSTALLATION SCRIPTS** that other developers will use. The files here are **NOT meant to be executed directly** in this repository - they are **source templates** that get copied to user systems during installation.

## 🧠 Understanding the Meta-Architecture

ContextKit is a "template distribution system" - this repository contains:
1. **Templates** - Files that get copied and customized during installation  
2. **Installation scripts** - Logic that copies templates to user systems
3. **Documentation** - Explains how the system works

**Key Mental Model**: Think of this repository as a "template factory" that produces customized development environments for other projects.

---

## 📂 Complete Repository Structure & Purpose

```
ContextKit/
├── 📄 install.sh                    # GLOBAL INSTALLER (users run: curl | sh)
├── 📖 README.md                     # Public documentation  
├── 📖 CLAUDE.md                     # This file - development guidance for AI assistants
├── 📖 LICENSE                       # MIT license
├── 📄 CHANGELOG.md                  # Version tracking and migration support
└── 🎯 Templates/                     # TEMPLATE DISTRIBUTION CENTER
    ├── Guidelines/                  # → GLOBAL CODING STANDARDS (copied by install.sh)
    │   ├── Swift.md                 # Swift patterns
    │   ├── SwiftUI.md               # SwiftUI patterns
    │   └── TaskCompletion.md        # Task completion criteria and ADR validation rules
    ├── Commands/                    # → CLAUDE CODE COMMANDS (get copied during /ctxk:proj:init)
    │   ├── proj/                    # Project management commands
    │   │   ├── init.md              # Project initialization
    │   │   ├── init-workspace.md    # Workspace configuration
    │   │   └── migrate.md           # Version updates
    │   ├── plan/                    # Feature planning workflow
    │   │   ├── 1-spec.md            # Business requirements
    │   │   ├── 2-research-tech.md   # Technical research and architecture
    │   │   └── 3-steps.md           # Implementation breakdown
    │   ├── impl/                    # Development workflow
    │   │   ├── start-working.md     # Context-aware development start
    │   │   ├── commit-changes.md    # Smart commit message generation
    │   │   ├── release-app.md       # iOS/macOS App Store releases
    │   │   └── release-package.md   # Swift Package releases
    │   └── bckl/                    # Backlog management
    │       ├── add-idea.md          # Capture new ideas with evaluation
    │       ├── add-bug.md           # Bug report with impact assessment
    │       ├── prioritize-ideas.md  # Organize ideas backlog
    │       ├── prioritize-bugs.md   # Triage bugs backlog
    │       ├── remove-idea.md       # Remove completed ideas from backlog
    │       └── remove-bug.md        # Remove fixed bugs from backlog
    ├── Scripts/                     # → ALL SCRIPTS (hooks & standalone, get copied during /ctxk:proj:init)
    │   ├── AutoFormat.sh           # Auto-format edited Swift files (PostToolUse hook)
    │   ├── VersionStatus.sh        # Version checking and status display (SessionStart hook)
    │   └── CustomStatusline.sh     # Complete statusline script with 5h-usage tracking and colored progress bars
    ├── Agents/                      # → AI ASSISTANTS (get copied during /ctxk:proj:init)
    │   ├── build-project.md         # [READY] Execute builds with constitutional compliance checking
    │   ├── check-accessibility.md   # [INCOMPLETE] Accessibility compliance validation (VoiceOver, contrast, etc.)
    │   ├── check-localization.md    # [INCOMPLETE] Localization readiness audit (String Catalog, cultural adaptation)
    │   ├── check-error-handling.md  # [INCOMPLETE] ErrorKit pattern validation and typed throws
    │   ├── check-modern-code.md     # [INCOMPLETE] API modernization (Date.now, Duration, async/await)
    │   ├── check-code-debt.md       # [INCOMPLETE] Technical debt cleanup and code consolidation
    │   ├── run-test-suite.md        # [READY] Execute complete test suite with build validation and structured failure reporting
    │   └── run-specific-test.md     # [READY] Execute specific test with build validation and focused failure analysis
    ├── Features/                    # → FEATURE TEMPLATES (used by /ctxk:plan:1-spec, /ctxk:plan:quick, etc.)
    │   ├── Spec.md                  # Business requirements and user stories (spec-kit methodology)
    │   ├── Tech.md                  # Technical architecture and constitutional compliance
    │   ├── Steps.md                 # Implementation task breakdown with parallel markers [P]
    │   └── Quick.md                 # Quick task planning template with interactive validation
    ├── Contexts/                    # → CONTEXT TEMPLATES (used by /ctxk:proj:init and /ctxk:proj:init-workspace)
    │   ├── Project.md               # Project-level Context.md with ContextKit configuration
    │   └── Workspace.md             # Workspace-level Context.md with client/company overrides
    ├── Decisions/                   # → ARCHITECTURE DECISIONS (Context/Decisions/ created during /ctxk:proj:init)
    │   └── ADR.md                   # Architecture Decision Record template
    ├── Backlog/                     # → BACKLOG TEMPLATES (used by /ctxk:bckl:add-idea and /ctxk:bckl:add-bug)
    │   ├── Ideas-Inbox.md           # New idea capture template with evaluation framework
    │   ├── Ideas-Backlog.md         # Prioritized idea backlog template with strategic organization
    │   ├── Bugs-Inbox.md            # Bug report intake template with impact assessment
    │   └── Bugs-Backlog.md          # Triaged bug backlog template with severity-based organization
    ├── Formatters/                  # → CODE STYLE CONFIGS (get copied during /ctxk:proj:init)
    │   ├── .swift-format            # Apple swift-format configuration
    │   └── .swiftformat             # SwiftFormat (Nick Lockwood) configuration
    └── settings.json                # → CLAUDE CODE SETTINGS TEMPLATE
```

---

## 🔄 Installation & Copy Flow

### Phase 1: Global Installation (`./install.sh`)

**When users run**: `curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh`

**What happens**:
```bash
# 1. Clone or update ContextKit repository to ~/.ContextKit/
git clone --depth 1 https://github.com/FlineDev/ContextKit.git ~/.ContextKit/
# OR git pull origin main (if updating existing installation)

# 2. Install ALL commands to user's Claude Code as ctxk shorthand
mkdir -p ~/.claude/commands/ctxk/
cp -R ~/.ContextKit/Templates/Commands/* ~/.claude/commands/ctxk/

# 3. Result: User has ContextKit repository + ALL /ctxk:* commands available globally
```

**All Commands Available After Install**:
- `/ctxk:proj:init` - Initialize project with ContextKit
- `/ctxk:proj:init-workspace` - Configure workspace-level settings
- `/ctxk:proj:migrate` - Update existing project to newer ContextKit version
- `/ctxk:plan:1-spec` - Create feature specification (prompts for description interactively)
- `/ctxk:plan:2-research-tech` - Create technical research and architecture plan
- `/ctxk:plan:3-steps` - Break down implementation steps
- `/ctxk:plan:quick` - Quick planning for smaller tasks with interactive validation
- `/ctxk:impl:start-working` - Begin development with context
- `/ctxk:impl:commit-changes` - Commit with proper message formatting
- `/ctxk:impl:release-app` - iOS/macOS app release workflow
- `/ctxk:impl:release-package` - Swift package release workflow
- `/ctxk:bckl:add-idea` - Capture new ideas
- `/ctxk:bckl:add-bug` - Report bugs
- `/ctxk:bckl:prioritize-ideas` - Organize ideas backlog
- `/ctxk:bckl:prioritize-bugs` - Triage bugs backlog
- `/ctxk:bckl:remove-idea` - Remove completed ideas from backlog
- `/ctxk:bckl:remove-bug` - Remove fixed bugs from backlog

### Phase 2: Project Setup (`/ctxk:proj:init`)

**When users run**: `/ctxk:proj:init` (in their project directory)

**What `/ctxk:proj:init` does** (this command template will be implemented to):
```bash
# 1. Detect project type (Swift, JS, Python, etc.)
# 2. Create project Context.md (using Templates/Contexts/Project.md as template)  
# 3. Create directory structure:
mkdir -p Context/Features Context/Backlog Context/Scripts

# 4. Copy project-specific files:
# Scripts → Context/Scripts/ (for team sharing) + ~/.claude/ (statusline)
cp ~/.ContextKit/Templates/Scripts/AutoFormat.sh Context/Scripts/
cp ~/.ContextKit/Templates/Scripts/VersionStatus.sh Context/Scripts/  
cp ~/.ContextKit/Templates/Scripts/CustomStatusline.sh ~/.claude/

# Agents → .claude/agents/ctxk/
mkdir -p .claude/agents/ctxk
cp ~/.ContextKit/Templates/Agents/* .claude/agents/ctxk/

# Settings → .claude/settings.json (merge with user prompts)
# merge ~/.ContextKit/Templates/settings.json → .claude/settings.json

# Formatters → project root (for Swift projects only)
cp ~/.ContextKit/Templates/Formatters/.swift* ./

# Result: Project configured for ContextKit development workflows
```

**Commands Already Available Globally** (no additional setup needed):
All `/ctxk:*` commands listed above are already installed and work in any directory

### Phase 3: Feature Development (Commands Use Templates)

**FULL WORKFLOW - When users run**: `/ctxk:plan:1-spec`

**What the command does**:
```bash
# 1. Read project Context.md to understand project type
# 2. Generate feature name: "UserAuthentication"
# 3. Create feature directory: Context/Features/001-UserAuthentication/
# 4. Copy & customize feature templates:
cp ~/.ContextKit/Templates/Features/Spec.md Context/Features/001-UserAuthentication/Spec.md
cp ~/.ContextKit/Templates/Features/Tech.md Context/Features/001-UserAuthentication/Tech.md
cp ~/.ContextKit/Templates/Features/Steps.md Context/Features/001-UserAuthentication/Steps.md

# 5. The templates are NOT variable-substituted - they contain dynamic logic
# 6. Create git branch: "feature/001-user-authentication"
# 7. Result: Ready-to-use feature development structure with active templates
```

**QUICK WORKFLOW - When users run**: `/ctxk:plan:quick`

**What the command does**:
```bash
# 1. Read project Context.md to understand project type
# 2. Codebase analysis and optional research
# 3. Interactive validation in chat:
#    - Present understanding summary
#    - Show In Scope / Out of Scope / Edge Cases
#    - Wait for user confirmation or corrections
# 4. After confirmation, create single file:
cp ~/.ContextKit/Templates/Features/Quick.md Context/Features/002-FixLoginButton.md

# 5. Populate file with confirmed understanding
# 6. NO git branch creation (work on current branch)
# 7. Result: Single-file plan ready for immediate work
```

**File structure comparison**:
```
Context/Features/
├── 001-UserAuthentication/     ← Full workflow (folder with 3 files)
│   ├── Spec.md
│   ├── Tech.md
│   └── Steps.md
├── 002-FixLoginButton.md       ← Quick workflow (single file)
├── 003-OfflineSync/            ← Full workflow (folder with 3 files)
│   ├── Spec.md
│   ├── Tech.md
│   └── Steps.md
└── 004-AddDarkMode.md          ← Quick workflow (single file)
```

Both workflows share sequential numbering to maintain chronological development history.

---

## 📋 Template Versioning System

**CRITICAL REQUIREMENT**: All template files that get copied during installation must include version information on **line 2** for migration tracking and automated updates.

### Versioning Structure

#### For .md Files
```markdown
# [File Title]
<!-- Template Version: X | ContextKit: Y.Y.Y | Updated: YYYY-MM-DD -->

[File content starts here...]
```

#### For .sh Files
```bash
#!/bin/bash
# Template Version: X | ContextKit: Y.Y.Y | Updated: YYYY-MM-DD

# [File description and purpose]

[File content starts here...]
```

#### For Agents (.md files with YAML frontmatter)
```yaml
---
meta: "Template Version: X | ContextKit: Y.Y.Y | Updated: YYYY-MM-DD"
name: agent-name
description: Agent description
tools: Read, Edit, Grep
---

# Agent: agent-name
```

### Parsing Requirements

- **Line 2 MANDATORY**: Version info must always be on line 2 for ALL file types
- **Format**: `Template Version: X | ContextKit: Y.Y.Y | Updated: YYYY-MM-DD`
- **Implementation**:
  - Regular .md files: HTML comment on line 2
  - .sh files: Shell comment on line 2
  - Agents: YAML `meta:` field on line 2
- **Parsing Command**: `sed -n '2p' file | grep "Template Version"`
- **Migration Usage**: `/ctxk:proj:migrate` command uses this for version detection

### Files Requiring Versioning (40 files)

**All .md template files**:
- `Templates/Guidelines/*.md` (2 files)
- `Templates/Commands/**/*.md` (17 files)
- `Templates/Agents/*.md` (8 files)
- `Templates/Features/*.md` (4 files)
- `Templates/Backlog/*.md` (4 files)

**All .sh template files**:
- `Templates/Scripts/*.sh` (3 files)

### Special Case: CHANGELOG.md

**CHANGELOG.md uses modified format** (since it contains the ContextKit version):
```markdown
# ContextKit Changelog
<!-- ContextKit: Y.Y.Y | Updated: YYYY-MM-DD -->
```

### Files Excluded from Versioning (7 files)

**Core Repository Files** (not copied during installation):
- `install.sh` - Global installer script
- `README.md` - Public documentation
- `CLAUDE.md` - This development guide
- `LICENSE` - MIT license file

**User-Editable Configuration Files** (become project/workspace specific):
- `Templates/Contexts/Project.md` - Becomes user-editable project configuration
- `Templates/Contexts/Workspace.md` - Becomes user-editable workspace configuration

**Rarely Changed Configuration Files**:
- `Templates/settings.json` - Claude Code settings template
- `Templates/Formatters/*` - Formattter config files

### Version Management Rules

1. **Template Version**: Integer increment (0, 1, 2, 3...) for each file modification
2. **ContextKit Version**: Semantic version of overall ContextKit system
3. **Updated Date**: ISO format (YYYY-MM-DD) when file was last modified
4. **Migration Tracking**: `/ctxk:proj:migrate` compares versions to determine update needs
5. **Changelog Integration**: All version changes must be documented in CHANGELOG.md

### 🚨 CRITICAL: Version Update Requirements

**MANDATORY when editing any template file with versioning header:**

1. **Always increment Template Version** - Even for minor changes, typo fixes, or behavioral adjustments
2. **Always update the Updated date** - Set to current date (YYYY-MM-DD format)
3. **Both updates are required together** - Never update one without the other

**Example required change pattern:**
```markdown
<!-- Template Version: 1 | ContextKit: 0.0.0 | Updated: 2025-09-14 -->
↓ becomes ↓
<!-- Template Version: 2 | ContextKit: 0.0.0 | Updated: 2025-09-16 -->
```

**Why this is critical:**
- Migration detection relies on version numbers to identify outdated files
- Users need accurate update tracking for their customizations
- Automated updates fail without proper version increments

**Example Migration Detection**:
```bash
# Check if user's template is outdated (all files use line 2)
USER_VERSION=$(sed -n '2p' .claude/commands/ctxk/plan/1-spec.md | grep -o "Template Version: [0-9]*" | grep -o "[0-9]*")
LATEST_VERSION=$(sed -n '2p' ~/.ContextKit/Templates/Commands/plan/1-spec.md | grep -o "Template Version: [0-9]*" | grep -o "[0-9]*")

if [ "$USER_VERSION" -lt "$LATEST_VERSION" ]; then
    echo "⚠️ Template outdated: plan/1-spec.md v$USER_VERSION → v$LATEST_VERSION"
fi

# Works for agents too since they use meta: field on line 2
AGENT_USER_VERSION=$(sed -n '2p' .claude/agents/ctxk/check-modern-code.md | grep -o "Template Version: [0-9]*" | grep -o "[0-9]*")
AGENT_LATEST_VERSION=$(sed -n '2p' ~/.ContextKit/Templates/Agents/check-modern-code.md | grep -o "Template Version: [0-9]*" | grep -o "[0-9]*")
```

---

## 📋 Template Categories & Implementation Details

### 🎯 **Templates/Commands/** - Claude Code Commands
**Purpose**: Command templates that get installed globally during `install.sh`  
**Copy Destination**: `~/.claude/commands/ctxk/` (ALL commands available globally after install.sh)  
**Format**: Standard Claude Code command markdown files with execution logic  
**Variables**: **NONE** - Commands read `Context.md` dynamically when executed

**Directory Structure in Templates/Commands/**:
- `proj/` - Project management (init, init-workspace, migrate)
- `plan/` - Feature planning (1-spec, 2-research-tech, 3-steps, quick)
- `impl/` - Implementation (start-working, commit-changes, release-app, release-package)
- `bckl/` - Backlog management (add-idea, add-bug, prioritize-ideas, prioritize-bugs, remove-idea, remove-bug)

**AI Implementation Focus**:
- Include execution flows with explicit branching logic
- Add constitutional compliance validation gates
- Implement project type detection (swift-package, ios-app, etc.)
- Provide clear error conditions with actionable guidance

### 📜 **Templates/Scripts/** - All Scripts (Hooks & Standalone)
**Purpose**: Shell scripts for automation hooks and utilities  
**Copy Destinations**: 
- `AutoFormat.sh`, `VersionStatus.sh` → `Context/Scripts/` (team sharing)
- `CustomStatusline.sh` → `~/.claude/` (personal statusline)
**Format**: Cross-platform shell scripts

**Files & AI Implementation Notes**:
- `AutoFormat.sh` - PostToolUse hook: detect Swift files, run SwiftFormat + swift-format
- `VersionStatus.sh` - SessionStart hook: check ContextKit versions, display migration warnings  
- `CustomStatusline.sh` - Standalone: 5h usage tracking with colored progress bars

### ⚙️ **Templates/settings.json** - Claude Code Configuration
**Purpose**: Complete Claude Code settings template with ContextKit defaults  
**Copy Destination**: Merged into `.claude/settings.json` with user preference prompts  
**Format**: JSON configuration file
**Variables**: **NONE** - Static configuration

**Contains**: Model defaults ("claude-3-5-sonnet-20241022"), statusline configuration, hook execution setup, ContextKit permissions

### 🤖 **Templates/Agents/** - AI Quality Assistants
**Purpose**: Specialized AI assistants for autonomous quality checks
**Copy Destination**: `.claude/agents/ctxk/`
**Format**: Markdown with YAML frontmatter (proper Claude Code agent format)
**Variables**: **NONE** - Dynamic context reading

**Agent Status & Implementation Focus**:

**Ready Agents**:
- `build-project.md` - Execute builds, filter developer comments, report errors/warnings
- `run-test-suite.md` - Execute complete test suite with build validation and structured failure reporting
- `run-specific-test.md` - Execute specific test with build validation and focused failure analysis
- `check-task-completion.md` - Validate task completion against ADRs and Spec

**Incomplete Agents** (need rework for read-only reporting):
- `check-accessibility.md` - VoiceOver labels, color contrast, dynamic type validation
- `check-localization.md` - String Catalog analysis, cultural adaptation, region formatters
- `check-error-handling.md` - ErrorKit patterns, typed throws, user-friendly error messages
- `check-modern-code.md` - Replace Date() → Date.now, TimeInterval → Duration, async/await
- `check-code-debt.md` - Remove AI artifacts, consolidate patterns, extract components

**Rework Requirements for check-* agents**:
- Convert from automatic fixing to read-only reporting
- Provide structured output for manual fixing
- Enable parallel execution (no write conflicts)
- Clear actionable guidance for each issue type

### 📝 **Templates/Features/** - Feature Development Templates
**Purpose**: Templates copied during feature planning commands
**Copy Destination**:
- Full workflow: `Context/Features/XXX-[FeatureName]/` (folder) during `/ctxk:plan:1-spec`
- Quick workflow: `Context/Features/XXX-[TaskName].md` (file) during `/ctxk:plan:quick`
**Format**: Markdown with spec-kit execution flows
**Variables**: **NONE** - Templates contain dynamic logic, no static substitution

**Templates & AI Implementation Focus**:

**Full Workflow Templates** (3 files per feature):
- `Spec.md` - Business requirements with forced uncertainty marking `🚨 [NEEDS CLARIFICATION: X]`
- `Tech.md` - Technical architecture with constitutional compliance gates
- `Steps.md` - Implementation breakdown with parallel markers `[P]` and S001-S999 numbering

**Quick Workflow Template** (1 file per task):
- `Quick.md` - Single-file plan with:
  - Input section (verbatim user description)
  - Understanding section (In Scope/Out of Scope/Edge Cases - validated interactively)
  - Code Context section (relevant files and patterns, may include research findings)
  - Implementation Approach (detailed technical decisions and rationale)
  - Tasks checklist (as many as needed)
  - NO git branch creation, NO quality gates, designed for efficiency

### 🏗️ **Templates/Contexts/** - Configuration Templates
**Purpose**: Context.md templates for project and workspace configuration  
**Copy Destination**: Project root (`Context.md`) and workspace directories  
**Format**: Markdown configuration with project detection logic  
**Variables**: **NONE** - Templates detect and populate information dynamically

**Templates & AI Implementation Focus**:
- `Project.md` - Auto-detect project type, architecture, workspace inheritance
- `Workspace.md` - Client/company overrides, coding style adjustments, constitutional principle modifications

### 📋 **Templates/Backlog/** - Backlog Management Templates
**Purpose**: Idea and bug backlog templates with structured evaluation  
**Copy Destination**: `Context/Backlog/` during initial setup as starting templates  
**Format**: Markdown with evaluation frameworks and prioritization systems  
**Variables**: **NONE** - Static template structure

**Templates & AI Implementation Focus**:
- `Ideas-Inbox.md` - Capture template with evaluation criteria, effort estimation
- `Ideas-Backlog.md` - Prioritized backlog with strategic organization patterns  
- `Bugs-Inbox.md` - Bug report template with impact assessment, reproduction steps  
- `Bugs-Backlog.md` - Triaged backlog with severity classification, effort estimation

### 📐 **Templates/Formatters/** - Code Style Configuration
**Purpose**: Formatter configuration files for consistent code style  
**Copy Destination**: Project root (Swift projects only)  
**Format**: Configuration files for formatting tools
**Variables**: **NONE** - Static configuration

**Files**:
- `.swift-format` - Apple swift-format configuration (3-space indentation, constitutional style)  
- `.swiftformat` - SwiftFormat configuration (Nick Lockwood tool)

---

## 🛠️ AI Development Guidelines

### Spec-Kit Integration Patterns

Every command template must implement **executable workflows with built-in quality gates**:

```markdown
## Execution Flow (main)
1. Parse user input and validate
   → If empty/invalid: ERROR "Specific guidance on fixing"
2. Load Context.md and detect project type
   → If missing: ERROR "Run /ctxk:proj:init first"
3. Apply constitutional principles
   → Check: accessibility, privacy, localizability, maintainability
4. Mark uncertainties explicitly
   → Use: 🚨 [NEEDS CLARIFICATION: specific question]
5. Validate against quality gates
   → If fails: Document in Complexity Tracking, require justification
6. Execute phase-specific logic
7. Return: SUCCESS (ready for next phase) or ERROR with guidance
```

### Constitutional Compliance Gates

Embed these validation checkpoints in every template where applicable:

```markdown
## Constitutional Validation
- [ ] Accessibility-first design validated?
- [ ] Privacy by design considerations documented?
- [ ] Localizability from day one confirmed?
- [ ] Platform-appropriate UX patterns followed?
- [ ] Code maintainability standards met?
- [ ] Simple solutions chosen over complex ones?
```

### Interactive User Questions with AskUserQuestion Tool

**CRITICAL**: All user questions in command templates MUST use the AskUserQuestion tool for structured interactive questions.

**Purpose**: Standardized, interactive question-answer interface with structured options and automatic "Other" choice for custom input.

---

#### Pattern: Context Display + Question

When asking questions that need context, use this two-part pattern:

**1. Display Context Information (in formatted box)**

```markdown
- Display context in chat:
  ```
  ═══════════════════════════════════════════════════
  [ICON] HEADER - Descriptive Title
  ═══════════════════════════════════════════════════

  [Relevant information that helps user understand the question]
  [File paths, current state, warnings, summaries, etc.]

  ═══════════════════════════════════════════════════
  ```
```

**2. Ask Question (with AskUserQuestion tool)**

```markdown
- Use AskUserQuestion tool with these parameters:
  ```json
  {
    "questions": [
      {
        "question": "Clear, specific question about the context above?",
        "header": "Short Label",
        "options": [
          {"label": "Option 1", "description": "What this choice means"},
          {"label": "Option 2", "description": "What this alternative means"}
        ],
        "multiSelect": false
      }
    ]
  }
  ```
- Wait for user response
```

**Box Header Icons**:
- ⚠️ WARNING - Critical alerts requiring user attention
- 📋 UNDERSTANDING/INFO - Summary information for review
- 👤 MANUAL TASK - Tasks requiring manual user action
- 🚀 AUTOMATED TASK - Tasks to be executed by AI
- 🔍 SEARCH RESULTS - Multiple items found from search
- 🗑️ CONFIRM REMOVAL - Deletion confirmations

**Box Width Standards**:
- 51 characters `═══════════════════════════════════════════════════` (standard)
- 64 characters `════════════════════════════════════════════════════════════════` (wide/detailed)
- 60 characters `────────────────────────────────────────────────────────────────` (separator/confirmation)

---

#### Pattern: Simple Questions (No Context Box Needed)

For configuration questions where the question itself provides sufficient context:

```markdown
- Use AskUserQuestion tool with these parameters:
  ```json
  {
    "questions": [
      {
        "question": "Set default model to 'sonnet' for better 5-hour limit management? (Current: [current/none]. Default Claude Code uses Opus which burns through the 5-hour limit quickly.)",
        "header": "Model Config",
        "options": [
          {
            "label": "Yes (recommended)",
            "description": "Use Sonnet to avoid burning through 5h limit with Opus on complex planning"
          },
          {
            "label": "No, keep current",
            "description": "Keep existing model configuration unchanged"
          }
        ],
        "multiSelect": false
      }
    ]
  }
  ```
- Wait for user response
```

---

#### Multiple Questions at Once

Ask up to 4 sequential questions in one call:

```json
{
  "questions": [
    {
      "question": "Which Claude plan do you have? (for usage tracking)",
      "header": "Plan Type",
      "options": [
        {"label": "Pro ($20/month)", "description": "Standard 5-hour usage limit"},
        {"label": "Max 5x ($100/month)", "description": "5x extended usage limit"},
        {"label": "Max 20x ($200/month)", "description": "20x extended usage limit"}
      ],
      "multiSelect": false
    },
    {
      "question": "Enable custom statusline with usage tracking?",
      "header": "Status Line",
      "options": [
        {"label": "Yes", "description": "Show real-time 5h usage and context progress bars"},
        {"label": "No", "description": "Use default Claude Code statusline"}
      ],
      "multiSelect": false
    }
  ]
}
```

---

#### Multi-Select Questions

For selecting multiple items (components, features, etc.):

```json
{
  "questions": [
    {
      "question": "Which components will be affected by this feature?",
      "header": "Components",
      "options": [
        {"label": "Root workspace", "description": "Main repository in current directory"},
        {"label": "iOS App", "description": "Mobile application component"},
        {"label": "Server API", "description": "Backend service component"}
      ],
      "multiSelect": true
    }
  ]
}
```

---

#### Best Practices

1. **Question Text**: Always end with `?`, be specific and clear
2. **Header**: Max 12 characters, concise label (e.g., "Model Config", "Plan Type", "Components")
3. **Label**: 1-5 words, what the user sees in the selection
4. **Description**: Explain what this choice means, trade-offs, or implications
5. **Multi-Select**: Use `true` when user can select multiple options
6. **Options Count**: Provide 2-4 options (tool automatically adds "Other" for custom input)
7. **Wait for Response**: Always include "Wait for user response" after the tool invocation
8. **Context Boxes**: Use for complex scenarios where user needs to review information before answering
9. **Simple Questions**: Skip context boxes when question itself is self-explanatory

**When NOT to Use**:

- Simple command parameters (use standard parameters instead)
- Purely informational messages with no question
- Questions already answered by previous user input

**Real Examples from ContextKit**:

- **Simple question**: Model configuration (no box needed - question explains context)
- **Context + question**: Manual task details (box shows task info, question asks for status)
- **Context + question**: Understanding confirmation (box shows analysis, question asks for validation)
- **Context + question**: Search results (box shows matches, question asks which to select)

### Template Creation Rules

1. **Commands** (`Templates/Commands/`): 
   - Read `Context.md` dynamically when executed
   - Include project type detection logic
   - NO variable substitution - pure execution logic

2. **Features** (`Templates/Features/`): 
   - Contain spec-kit execution flows
   - NO variable substitution - dynamic content generation
   - Include forced uncertainty marking patterns

3. **Contexts** (`Templates/Contexts/`): 
   - Auto-detect project information
   - NO variable substitution - intelligent template logic
   - Include hierarchical inheritance patterns

4. **Agents** (`Templates/Agents/`):
   - YAML frontmatter with tool specifications
   - Focused scope (single quality concern)
   - Clear success/failure reporting

5. **Scripts** (`Templates/Scripts/`): 
   - Cross-platform shell script compatibility
   - Simple, focused functionality
   - Error handling with user-friendly messages

---

## 🧪 Development Workflow for ContextKit Maintainers

### Testing Your Template Changes

```bash
# 1. Test global installation
cd /Volumes/Projects/Developer/Indie/Packages/ContextKit
./install.sh

# 2. Create test project  
mkdir ~/test-contextkit-project && cd ~/test-contextkit-project
git init

# 3. Test project setup
claude  # Start Claude Code
/ctxk:proj:init  # Initialize with ContextKit

# 4. Test workflow commands function properly
# Full workflow:
/ctxk:plan:1-spec
/ctxk:plan:2-research-tech
/ctxk:plan:3-steps
/ctxk:impl:start-working

# Quick workflow:
/ctxk:plan:quick
```

### Common Development Pitfalls

1. **Creating executable commands instead of templates** 
   - Templates contain instruction flows for OTHER AI assistants
   - They guide future AI usage, not direct execution

2. **Adding variable substitution where none needed**
   - Commands and most templates work dynamically
   - Only use variables for static content that gets set once

3. **Missing constitutional compliance gates**
   - Every template needs quality validation checkpoints
   - Make gates blocking requirements, not suggestions

4. **Forgetting cross-platform compatibility**
   - Scripts must work on macOS, Linux, and WSL2
   - Test installation across different environments

### File Validation Checklist

Before committing template changes:

- [ ] Template contains execution flow with error conditions
- [ ] Constitutional validation gates included where applicable
- [ ] Project type detection logic implemented (for commands)
- [ ] Clear success/error states defined
- [ ] Cross-platform compatibility verified (for scripts)
- [ ] YAML frontmatter correct (for agents)
- [ ] No unnecessary variable substitution added
- [ ] Testing workflow completed successfully

---

## 🎯 ADR Integration System

The repository includes a complete ADR (Architecture Decision Record) system for tracking deviations from planned specifications and managing architectural decisions:

### Components
- **Templates/Decisions/ADR.md** - Template for documenting architectural decisions and deviations
- **Templates/Agents/check-task-completion.md** - Agent that validates task completion against ADRs
- **Templates/Guidelines/TaskCompletion.md** - Validation criteria for task completion

### Integration Points
- **Context/Decisions/** directory created during `/ctxk:proj:init`
- **start-working.md** loads ADRs at development session start
- **Milestone validation** uses check-task-completion agent to verify ADR compliance
- Deviations from Spec.md automatically trigger ADR creation prompts

### Usage Pattern
1. During planning (Spec/Tech/Steps): Decisions are documented
2. During implementation (start-working): ADRs are loaded as context
3. At milestones: check-task-completion validates against planning
4. Deviations create ADRs for team visibility and future reference

---

## 💡 Remember: Meta-Development Mindset

You're building a system that creates development environments for other projects. Every template you create will guide AI assistants working on completely different codebases and project types.

Focus on:
- **Systematic thinking patterns** that work across project types
- **Clear validation gates** that prevent common AI mistakes  
- **Constitutional principles** embedded in every workflow
- **Spec-kit methodology** that ensures consistent quality

When in doubt, ask: "How will this template help an AI assistant build better software in a Swift/iOS project they've never seen before?"

---

## 📋 File Categories: Usage Patterns & User Customization

### 🔄 **User-Managed Files** (Full user control, no ContextKit updates)
These files become completely user-managed after initial setup:

- **`Templates/Contexts/Project.md`** → becomes `Context.md` in project root
- **`Templates/Contexts/Workspace.md`** → becomes `Context.md` in workspace directory
- **`Templates/Features/*.md`** → copied to `Context/Features/[FeatureName]/` or `Context/Features/XXX-[TaskName].md` during planning
  - Full workflow: creates folder with Spec.md, Tech.md, Steps.md
  - Quick workflow: creates single Quick.md file
- **`Templates/Formatters/.*`** → formatter config files copied to project root (`.swift-format`, `.swiftformat`)

**Key Characteristics**:
- **No migration updates**: Users modify freely, `/ctxk:proj:migrate` never overwrites
- **Full customization**: Users add project-specific content, modify structure as needed
- **Safe to customize**: Formatter configs, Context files, Features, and Backlog templates are yours to edit
- **Hierarchical inheritance**: Context files provide workspace → project inheritance

### 🛠️ **ContextKit-Managed Files** (Updated via migration, support user customization)
These files are maintained by ContextKit but support project-specific customization:

- **`Templates/Commands/**/*.md`** - Claude Code command templates
- **`Templates/Agents/*.md`** - AI quality assistant templates
- **`Templates/Backlog/*.md`** - Backlog management templates with evaluation frameworks
- **`Templates/Guidelines/*.md`** - Development reference guidelines

**Key Characteristics**:
- **Migration updates**: `/ctxk:proj:migrate` updates core logic to newer versions
- **User customization sections**: Dedicated sections for project-specific additions (see User Customization Pattern below)
- **Version tracking**: Template version headers enable smart migration

### ⚙️ **Configuration Files** (Static, updated behavior varies)
- **`Templates/settings.json`** - Claude Code configuration (replaced entirely during migration)
- **`Templates/Formatters/.*`** - Formatter configuration files (**never updated** - set once during setup)
- **`Templates/Scripts/*.sh`** - Hook automation scripts (replaced entirely during migration, no customization sections)

### 🔧 **User Customization Pattern for ContextKit-Managed Files**

**Problem**: Commands and agents may need project-specific adjustments while maintaining updateability.

**Solution**: Dedicated user customization sections that are preserved during migration:

```markdown
[ContextKit-managed content above]

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Instructions

[User adds custom content here]

## Additional Examples

[User adds project-specific examples here]

## Override Behaviors

[User documents any project-specific requirement overrides here]
```

**Migration Behavior**:
- **Above the separator**: Updated by `/ctxk:proj:migrate` to latest ContextKit version
- **Below the separator**: Completely preserved, never modified by ContextKit

### 📝 **Mixed Content Pattern** (Template + AI Instructions)
Used only for user-managed files that combine template structure with AI generation logic:

**Separation Pattern**:
```
════════════════════════════════════════════════════════════════════════════════
║ 🤖 SYSTEM INSTRUCTIONS - [PURPOSE]
════════════════════════════════════════════════════════════════════════════════
║ AI execution logic goes here...
║ Indented with ║ prefix
║
════════════════════════════════════════════════════════════════════════════════
```

**Files using this pattern**:
- `Templates/Features/*.md` - Feature templates with AI generation logic (Spec.md, Tech.md, Steps.md, Quick.md)
- `Templates/Contexts/*.md` - Context generation templates
- `Templates/Backlog/*.md` - Backlog management templates

### 🔧 **Implementation Requirements for All ContextKit-Managed Files**

All commands, agents, and guidelines that get copied to user projects MUST include:

1. **Template Version Header**: Line 2 versioning for migration tracking
2. **User Warning**: Clear warning about editing restrictions and GitHub issue reporting
3. **User Customization Section**: Dedicated area for project-specific additions
4. **Clear Separation**: Visual separation between ContextKit-managed and user-editable content

**Required Warning Pattern** (after template version header):
```markdown
> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues
```

### 📝 **Content Review Guidelines**

**For User-Managed Files**:
- Review template structure and AI generation logic
- Ensure boxed separator pattern is correctly implemented
- Verify dynamic content generation produces appropriate output

**For ContextKit-Managed Files**:
- Review core execution logic for completeness and accuracy
- Verify user customization section is properly implemented
- Ensure version header is present on line 2
- Test migration behavior preserves user customizations

**For Configuration Files** (including Scripts):
- Standard review for functionality and cross-platform compatibility
- Scripts have warning headers but no customization sections (replaced entirely during migration)
- Other config files have no special sections (replaced entirely during migration)

---

## 🧭 Guidelines vs Agents: Role Separation

### **Templates/Guidelines/*.md - Strategic Planning Reference**

**Purpose**: High-level guidance for AI assistants during **planning and architecture phases**

**Usage Phases**:
- `/ctxk:plan:2-research-tech` - Architecture and framework decisions
- `/ctxk:plan:1-spec` - Technology stack selection
- Command planning and API selection phases

**Content Focus**:
- ✅ **API Preferences**: `Date.now` over `Date()`, `Duration` over `TimeInterval`
- ✅ **Framework Choices**: SwiftUI over UIKit, RESTClient over custom networking
- ✅ **Package Strategy**: Import FlineDevKit first, package-first development
- ✅ **Architecture Patterns**: MVVM, typed throws, dependency injection
- ✅ **Strategic Rules**: Constitutional principles, decision framework

**Content Style**: 
- Preference lists with ✅/❌ indicators
- Strategic "what to choose" guidance
- Framework and package recommendations
- Constitutional principle integration

**Example Entry**:
```markdown
### Networking
- ✅ **Prefer**: `RESTClient` from HandySwift for REST APIs
- ✅ **Prefer**: `IntelligenceKit` for AI service integration
- ❌ **Avoid**: Custom URLSession implementations
```

### **Templates/Agents/*.md - Quality Validation Specialists**

**Purpose**: Detailed issue detection in **existing code during development phases**

**Usage Phases**:
- `/ctxk:impl:commit-changes` - Pre-commit quality validation
- Quality gate enforcement during development
- Code review and cleanup phases

**Content Focus**:
- 🔍 **Specific Issues**: Find `Date()` usage, detect legacy patterns
- 🔍 **Common AI Mistakes**: Remove artifacts, fix generated code problems
- 🔍 **Pattern Detection**: Search patterns, regex rules, file analysis
- 🔍 **Detailed Reports**: Line numbers, specific fixes, actionable feedback

**Content Style**:
- YAML frontmatter with tool specifications
- Detailed search patterns and detection logic
- Specific error identification and reporting
- Automated fix suggestions

**Example Entry**:
```markdown
# check-modern-code.md

```yaml
tools: ["Read", "Grep"]
scope: "Swift source files"
```

## Detection Patterns
- Search for: `Date()`, `replacingOccurrences`, `TimeInterval`
- Look for: Traditional switch statements vs switch expressions

## Report Format
"Found 3 modernization issues:
- Line 45: Use Date.now instead of Date()
- Line 67: Use Duration instead of TimeInterval"
```

### **Clear Workflow Separation**

```
Planning Phase               Development Phase
├── Templates/Guidelines/*.md ├── Templates/Agents/*.md
│   ├── "What should I      │   ├── "What's wrong with
│   │   choose?"            │   │   what I wrote?"
│   ├── Strategic decisions │   ├── Issue detection
│   ├── API preferences     │   ├── Code validation  
│   └── Architecture rules  │   └── Quality gates
│                           │
▼                           ▼
/ctxk:plan:2-research-tech  /ctxk:impl:commit-changes
/ctxk:plan:1-spec           Quality validation
Framework selection         Code review
```

### **Key Benefits of This Separation**

1. **No Duplication**: Guidelines stay high-level, agents get detailed
2. **Clear Responsibilities**: Planning vs validation are distinct phases
3. **Efficient Context**: AI gets right level of detail for each phase
4. **Maintainability**: Guidelines change with strategy, agents with common issues
5. **Scalability**: Add new agents without bloating guidelines

### **Implementation Guidelines for Maintainers**

**When writing Guidelines**:
- Focus on strategic choices and preferences
- Use ✅/❌ format for quick reference
- Reference agents for detailed validation
- Keep examples minimal and preference-focused

**When writing Agents**:
- Focus on specific, detectable issues
- Include YAML frontmatter with required tools
- Provide detailed search patterns and detection logic
- Generate actionable reports with line numbers

---

## 🔗 Claude Code Hook Implementation

### Hook Interface
PostToolUse hooks receive **JSON data via stdin**:
```json
{
  "tool_input": {
    "file_path": "/path/to/edited/file.swift"
  }
}
```

### Script Implementation Pattern
```bash
# Extract file path from JSON input
FILE_PATH=$(jq -r '.tool_input.file_path')

# Process the edited file
if [[ "$FILE_PATH" == *.swift ]]; then
    swiftformat "$FILE_PATH"
fi
```

### Key Points
- **Input method**: JSON via stdin (not command arguments)
- **File processing**: One file per hook invocation
- **Documentation**: https://docs.anthropic.com/en/docs/claude-code/hooks-guide
- **Hook triggers**: Edit, MultiEdit, Write tools