# Initialize Project with ContextKit
<!-- Template Version: 11 | ContextKit: 0.2.0 | Updated: 2025-10-18 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Initialize current project with ContextKit development workflow system. Sets up systematic development environment with template distribution and context generation.

## Execution Flow (main)

### Phase 0: Check Customization

0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
   - Use `Grep` tool to find the start of the section
   - Read everything below that line contained in this document til the end of the file
   - Make sure to consider what was said there with high priority
   - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"

### Phase 1: Pre-Flight Checks & Critical Setup

1. **Verify Project Root Path**
   ```bash
   echo "Working in project: $(pwd)"
   ```
   - **CRITICAL**: Working directory persists between bash calls in Claude Code
   - Use `$(pwd)` when absolute paths are needed, avoid relying on stored variables

2. **Check Git Repository Status**
   ```bash
   git status --porcelain
   ```
   - If uncommitted changes exist: WARN user and ask for confirmation to continue
   - If not a git repository: WARN user and ask for confirmation to continue

3. **Initialize Git Submodules (if present)**
   ```bash
   if [ -f .gitmodules ]; then
       git submodule update --init --recursive
       echo "✅ Initialized git submodules"
   fi
   ```
   - Important for projects with submodule dependencies
   - Must be done early before component analysis

4. **Check Current Project Structure**
   - Use `Glob` tool to list project files: `Glob . *` to see all files and directories
   - Use `Glob . **/*.md` to find all markdown files in subdirectories

5. **Detect Existing ContextKit Installation**
   - Look for `Context.md` in project root
   - Check for `Context/` directory with subdirectories using `Glob Context *`
   - Check for `.claude/commands/ctxk/` directory using `Glob .claude/commands/ctxk *`
   - Check for `.claude/agents/ctxk/` directory using `Glob .claude/agents/ctxk *`
   - **If MOST exist**: ERROR "Project already initialized with ContextKit. Use `/ctxk:proj:migrate` for updates instead."

6. **Verify ContextKit Global Installation**
   ```bash
   ls -la ~/.ContextKit/Templates/ || echo "❌ ContextKit not installed globally. Run: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
   ```

7. **CRITICAL: Configure Settings for Permissions (HIGHEST PRIORITY)**
   - Use `Read` tool to check if `.claude/settings.json` exists
   - If doesn't exist: Copy complete template to get immediate permissions
   ```bash
   mkdir -p .claude
   cp ~/.ContextKit/Templates/settings.json .claude/settings.json
   echo "✅ Installed complete ContextKit settings for permissions"
   ```
   - If exists: Use `Edit` tool to merge permissions arrays intelligently:
     - **Allow list**: Remove existing entries that are subsets of ContextKit permissions, add ContextKit entries, remove exact duplicates, sort alphabetically
     - **Deny list**: Add ContextKit entries, remove only exact duplicates, sort alphabetically
   - **Result**: Now have full permissions for remaining steps

### Phase 2: User Configuration (Sequential Questions)

6. **Model Setting Configuration**
   - Use `Read` tool to examine current model setting in `.claude/settings.json`
   - If missing or different from "sonnet":
     - Use AskUserQuestion tool with these parameters:
       ```json
       {
         "questions": [
           {
             "question": "Set default model to 'sonnet' for better 5-hour limit management? (Current: [current/none detected]. Default Claude Code uses Opus which burns through the 5-hour limit quickly. ContextKit uses Sonnet to avoid hitting limits during complex planning phases while maintaining sufficient quality.)",
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
     - If user selects "Yes (recommended)": Use `Edit` tool to update model setting immediately

7. **Status Line Configuration**
   - Check current statusLine configuration in `.claude/settings.json`
   - If missing or different from "./Context/Scripts/CustomStatusline.sh":
     - Use AskUserQuestion tool with these parameters:
       ```json
       {
         "questions": [
           {
             "question": "Set to ContextKit statusline with real-time monitoring? (Current: [current/none detected]. Provides: '5h-Usage: 73% (1.4h left) | Chat: ▓▓▓▓▓▓░░░░ 64% (128k/200k)' with colored progress bars for context awareness.)",
             "header": "Status Line",
             "options": [
               {
                 "label": "Yes (recommended)",
                 "description": "Show real-time 5h usage and context progress bars with color coding"
               },
               {
                 "label": "No, keep current",
                 "description": "Keep existing statusline configuration"
               }
             ],
             "multiSelect": false
           }
         ]
       }
       ```
     - Wait for user response

8. **Claude Plan Selection** (only if user agreed to status line)
   - If user selected "Yes (recommended)" for status line:
     - Use AskUserQuestion tool with these parameters:
       ```json
       {
         "questions": [
           {
             "question": "Which Claude plan do you have? (for usage tracking in statusline)",
             "header": "Plan Type",
             "options": [
               {
                 "label": "Pro ($20/month)",
                 "description": "Standard 5-hour usage limit per day"
               },
               {
                 "label": "Max 5x ($100/month)",
                 "description": "5x extended usage limit (25 hours per day)"
               },
               {
                 "label": "Max 20x ($200/month)",
                 "description": "20x extended usage limit (100 hours per day)"
               }
             ],
             "multiSelect": false
           }
         ]
       }
       ```
     - Wait for user response
     - Store plan selection for status line configuration

9. **Workspace Discovery**
   - Start from current directory and traverse parent directories
   - Use absolute paths for checking: `ls "$(pwd)/../Context.md" 2>/dev/null`
   - Continue checking parent directories until reaching root `/` or finding workspace Context.md
   - **CRITICAL**: Calculate correct relative path to workspace Context.md (count levels up: 1 level = `../Context.md`, 2 levels = `../../Context.md`, etc.)
   - Example traversal:
     ```bash
     PROJECT_ROOT=$(pwd)
     CURRENT_DIR="$PROJECT_ROOT"
     while [ "$CURRENT_DIR" != "/" ]; do
         PARENT_DIR=$(dirname "$CURRENT_DIR")
         if [ -f "$PARENT_DIR/Context.md" ]; then
             # Found workspace Context.md
             LEVELS=$(echo "$PROJECT_ROOT" | sed "s|$PARENT_DIR/||" | tr '/' '\n' | wc -l)
             # Calculate relative path with correct number of ../
         fi
         CURRENT_DIR="$PARENT_DIR"
     done
     ```
   - If workspace context found:
     - Use AskUserQuestion tool with these parameters:
       ```json
       {
         "questions": [
           {
             "question": "Inherit from workspace context at [path]? This will configure project to follow workspace coding standards and constitutional principles.",
             "header": "Workspace",
             "options": [
               {
                 "label": "Yes (recommended)",
                 "description": "Follow workspace-level coding standards and principles"
               },
               {
                 "label": "No, standalone",
                 "description": "Configure project independently without workspace inheritance"
               }
             ],
             "multiSelect": false
           }
         ]
       }
       ```
     - Wait for user response
   - If multiple workspace contexts found:
     - Use AskUserQuestion with multiSelect=false to let user choose which workspace to inherit from

10. **Apply User Configurations**
    - Apply model setting (if user agreed)
    - Configure status line with plan parameter (if user agreed):
      - Pro: `"command": "./Context/Scripts/CustomStatusline.sh --plan Pro"`
      - Max 5x: `"command": "./Context/Scripts/CustomStatusline.sh --plan Max5"`
      - Max 20x: `"command": "./Context/Scripts/CustomStatusline.sh --plan Max20"`
    - Add ContextKit hooks:
      - PostToolUse hook: `./Context/Scripts/AutoFormat.sh`
      - SessionStart hook: `./Context/Scripts/VersionStatus.sh`

### Phase 3: Automated Template Installation

11. **Create Directory Structure**
   ```bash
   mkdir -p .claude/commands/ctxk .claude/agents/ctxk Context/Features Context/Backlog Context/Scripts Context/Decisions
   ```

12. **Copy Workflow Command Templates (Local Only)**
   ```bash
   cp -r ~/.ContextKit/Templates/Commands/plan .claude/commands/ctxk/
   cp -r ~/.ContextKit/Templates/Commands/impl .claude/commands/ctxk/
   cp -r ~/.ContextKit/Templates/Commands/bckl .claude/commands/ctxk/
   echo "✅ Copied workflow command templates (plan/, impl/, bckl/)"
   echo "ℹ️ Project commands (proj/) remain global and auto-update"
   ```
   > **Note**: Only workflow commands are copied locally. Project management commands (proj/) stay global for auto-updates.

13. **Copy Agent Templates**
   ```bash
   cp ~/.ContextKit/Templates/Agents/* .claude/agents/ctxk/
   echo "✅ Copied agent templates (build-project, check-accessibility, etc.)"
   ```
   > **Note**: `/*` means copy ALL .md files from Agents/ directory individually

14. **Copy Script Templates**
   ```bash
   cp -p ~/.ContextKit/Templates/Scripts/* Context/Scripts/
   chmod +x Context/Scripts/*.sh
   echo "✅ Copied script templates (AutoFormat.sh, VersionStatus.sh, etc.)"
   ```
   > **Note**: `-p` preserves permissions during copy, `chmod +x` ensures all .sh files are executable

15. **Detect Relevant Guidelines**
   ```bash
   # Ensure we're in project root before detection
   echo "Detecting guidelines from project root: $(pwd)"
   ```
   - Use simple file detection to determine project type (no deep component analysis needed):
     - Look for Package.swift or *.xcodeproj → Swift project
     - Look for SwiftUI imports in Swift files → SwiftUI project
     - Look for package.json → JavaScript project (if exists)
     - Look for requirements.txt/pyproject.toml → Python project (if exists)
   - Determine which guidelines are relevant for this specific project:
     - Swift projects with Package.swift or .xcodeproj → ["Swift"]
     - Swift projects importing SwiftUI → ["Swift", "SwiftUI"]
     - Python projects with requirements.txt/pyproject.toml → ["Python"] (if exists)
     - JavaScript/Node projects with package.json → ["JavaScript"] (if exists)
     - Multi-language projects → combine relevant guidelines
   - Store selected guidelines array for copying phase

16. **Copy Relevant Guidelines Only**
   ```bash
   # CRITICAL: Verify we're in project root before copying
   echo "Copying guidelines from project root: $(pwd)"
   mkdir -p Context/Guidelines
   # Copy only guidelines relevant to detected project type
   # Guidelines array determined by project analysis above
   SELECTED_GUIDELINES=(Swift SwiftUI)  # Example - actual array based on detection

   for guideline in "${SELECTED_GUIDELINES[@]}"; do
       if [[ -f "$HOME/.ContextKit/Templates/Guidelines/${guideline}.md" ]]; then
           cp "$HOME/.ContextKit/Templates/Guidelines/${guideline}.md" Context/Guidelines/
           echo "✅ Copied guideline: ${guideline}.md"
       else
           echo "⚠️ Guideline not found: ${guideline}.md (skipping)"
       fi
   done

   if [ ${#SELECTED_GUIDELINES[@]} -eq 0 ]; then
       echo "✅ No specific guidelines needed for this project type"
   fi
   ```

17. **Copy Backlog Templates**
   ```bash
   # CRITICAL: Verify we're in project root before copying
   echo "Copying backlog from project root: $(pwd)"
   mkdir -p Context/Backlog
   cp ~/.ContextKit/Templates/Backlog/* Context/Backlog/
   echo "✅ Copied backlog templates (Ideas-Inbox.md, Bugs-Backlog.md, etc.)"
   ```

18. **Copy Project Context Template**
    ```bash
    # CRITICAL: Verify we're in project root before copying
    echo "Copying Context.md to project root: $(pwd)"
    cp ~/.ContextKit/Templates/Contexts/Project.md Context.md
    echo "✅ Copied project context template"
    ```

### Phase 4: Deep Project Investigation & Build Validation

19. **Discover Project Components & Repositories**
    - Use `Bash` command to find ALL git repositories within project: `find "$(pwd)" -name ".git" -type d`
    - For each .git directory found, identify the repository root and purpose
    - Use `Read` tool to examine `.gitmodules` files to understand submodule structure
    - Create hierarchical map of all components/repositories within this project
    - **IMPORTANT**: Determine project structure:
      - **Single-component project** (e.g., just an app): Work directly in project root, no `cd` needed
      - **Multi-component project** (e.g., App/ and Server/): Use subshells `(cd ComponentPath && command)` to avoid changing working directory
    - **CRITICAL**: Every single component must be analyzed individually for development commands
    - **CRITICAL**: NEVER use bare `cd` commands - always use subshells to prevent persistent directory changes

20. **Deep Component Analysis for Each Repository/Component**
    For EVERY component found, perform comprehensive analysis:

    **A. Component Identity & Purpose Analysis**
    - Use `Read` tool on README.md, README.txt, or similar files to understand component purpose
    - Use `Bash` to check component type: app, server, package, documentation, tool, etc.
    - Use `Bash` to check git remote origins to understand component relationships
    - Determine component role within the larger project

    **B. Build System Detection & Command Discovery**
    - **Swift Projects**:
      - Use `Glob` for Package.swift, *.xcodeproj, *.xcworkspace files
      - For Xcode projects: Use `Bash` to list available schemes: `xcodebuild -list -project *.xcodeproj` or `xcodebuild -list -workspace *.xcworkspace`
      - For Package.swift: Use `Read` to detect executable products and dependencies
      - Detect if it's Vapor server: `Grep "import Vapor" --glob "*.swift"`
      - Detect if it's DocC documentation: `Glob` for *.docc folders
    - **JavaScript/Node Projects**:
      - Use `Glob` for package.json, yarn.lock, npm-shrinkwrap.json
      - Use `Read` on package.json to detect build scripts and dependencies
    - **Python Projects**:
      - Use `Glob` for requirements.txt, pyproject.toml, setup.py, Pipfile
      - Use `Read` to detect build and test configurations

    **C. Build Command Discovery & Validation**
    - **For Xcode Projects**: Construct and test build commands:
      ```bash
      # Single-component: Use project file in current directory
      xcodebuild -project [ProjectName].xcodeproj -scheme [MainScheme] -destination 'platform=iOS Simulator,name=iPhone 17' -dry-run build

      # Multi-component: Use full path from project root
      xcodebuild -project "$(pwd)/[ComponentPath]/[ProjectName].xcodeproj" -scheme [MainScheme] -destination 'platform=macOS' -dry-run build
      ```
      - Try multiple destinations if first fails: macOS, iOS Simulator, etc.
      - Document the working command format
    - **For Swift Packages**: Validate with:
      ```bash
      # Single-component: Run from current directory
      swift build --help >/dev/null 2>&1 && echo "✅ Swift build available"

      # Multi-component: Use subshell to avoid changing working directory
      (cd "[ComponentPath]" && swift build --help >/dev/null 2>&1 && echo "✅ Swift build available")
      ```
    - **For Node Projects**: Test `npm run build` or detected build script with `--dry-run` if available
    - **For Python Projects**: Test detected build command validation
    - **IMPORTANT**: Use simple paths for single-component projects, full paths only for multi-component

    **D. Test Command Discovery & Validation**
    - **For Xcode Projects**: Construct and test test commands:
      ```bash
      # Single-component: Use project file in current directory
      xcodebuild -project [ProjectName].xcodeproj -scheme [MainScheme] -showTestPlans

      # Multi-component: Use full path from project root
      xcodebuild -project "$(pwd)/[ComponentPath]/[ProjectName].xcodeproj" -scheme [MainScheme] -showTestPlans
      ```
    - **For Swift Packages**: Validate tests with:
      ```bash
      # Single-component: Run from current directory
      swift test --list-tests 2>/dev/null && echo "✅ Tests available"

      # Multi-component: Use subshell to avoid changing working directory
      (cd "[ComponentPath]" && swift test --list-tests 2>/dev/null && echo "✅ Tests available")
      ```
    - **For Node Projects**: Test `npm test` or detected test script availability
    - **For Python Projects**: Check for `pytest`, `python -m unittest`, or detected test command
    - **IMPORTANT**: Use simple commands for single-component projects, directory changes only for multi-component

    **E. Dependency & Version Analysis**
    - For Swift: Parse Package.swift dependencies and version constraints
    - For Node: Parse package.json dependencies and versions
    - For Python: Parse requirements.txt or pyproject.toml dependencies
    - Document critical dependencies and version requirements
    - Note any local/workspace dependencies between components

    **F. File Structure Mapping**
    - Use `Bash` to map key directory structure:
      ```bash
      # Single-component: Search from current directory
      find . -type d \( -name "Sources" -o -name "Tests" -o -name "src" -o -name "test" -o -name "docs" \) | head -20

      # Multi-component: Search specific component directory
      find "$(pwd)/[ComponentPath]" -type d \( -name "Sources" -o -name "Tests" -o -name "src" -o -name "test" -o -name "docs" \) | head -20
      ```
    - Document source directories, test directories, resource folders
    - Note configuration files, documentation directories

    **G. Code Style Detection**
    ONLY report what is ACTUALLY FOUND, never guess or assume:
    - Use `Read` on formatter config files: .swift-format, .swiftformat, .prettierrc, .eslintrc
    - Use `Bash` to detect actual indentation in source files: `head -10 Sources/**/*.swift | sed 's/\t/<TAB>/g'` (for Swift)
    - Use `Read` on .editorconfig files if present
    - Check for consistent patterns across source files in component

### Phase 5: Context Integration & Final Setup

21. **Create/Update CLAUDE.md with Context References**
    - Check if `CLAUDE.md` exists using `Read` tool
    - If `CLAUDE.md` exists:
      - Use `Read` to check current content
      - Use `Edit` to ensure `@Context.md` reference is present
      - If workspace Context.md discovered in Phase 1: ensure workspace reference is present using calculated relative path
    - If no `CLAUDE.md`: Use `Write` tool to create new one with:
      ```markdown
      # Project Development Context

      @Context.md
      [If workspace discovered in Phase 1: @[calculated-relative-path]/Context.md]
      ```
    - **CRITICAL**: Ensure both project Context.md AND workspace Context.md (if found in Phase 1) are referenced

22. **Copy Project-Specific Formatters** (for Swift projects only)
    - For Swift projects detected during investigation:
      ```bash
      cp ~/.ContextKit/Templates/Formatters/.swift-format .
      cp ~/.ContextKit/Templates/Formatters/.swiftformat .
      echo "✅ Copied Swift formatter configurations"
      ```

23. **Execute Context.md Template Instructions**
    - Use `Read` tool to read the copied `Context.md` file from `$(pwd)/Context.md`
    - Follow the **system instructions** section (boxed area) step by step
    - **CRITICAL**: Always work from project root when executing template instructions
    - **CRITICAL**: Use the comprehensive findings from Phase 4 investigation:
      - Component hierarchy and relationships discovered
      - Validated build commands for each component
      - Validated test commands for each component
      - Actual dependencies and versions found
      - File structure mappings created
      - Code style patterns detected from actual files
    - Generate Context.md content based on ACTUAL FINDINGS, not assumptions
    - **At completion**: Use `Edit` tool to remove the system instructions section entirely

### Phase 6: Verification & Completion

24. **Verify Installation**
    - Use `Read` tool to confirm `Context.md` exists and contains project-specific content
    - Use `Glob` tool to verify workflow commands exist: `.claude/commands/ctxk/plan/1-spec.md`, `.claude/commands/ctxk/impl/start-working.md`, `.claude/commands/ctxk/bckl/add-idea.md`
    - Use `Bash` tool to verify global proj commands accessible: `ls ~/.claude/commands/ctxk/proj/init.md`
    - Use `Bash` tool to check `Context/Scripts/AutoFormat.sh` is executable: `ls -la Context/Scripts/AutoFormat.sh`
    - Use `Glob` tool to validate at least 3 agent files exist in `.claude/agents/ctxk/`: `Glob .claude/agents/ctxk *`
    - Use `Bash` tool to verify status line configured with plan: `grep "CustomStatusline.sh --plan" .claude/settings.json`
    - Use `Read` tool to confirm `.claude/settings.json` contains ContextKit configuration

25. **Update Workspace Context (if applicable)**
    - If workspace Context.md was discovered in Phase 1:
      - Use `Read` tool to read the workspace Context.md file
      - Look for current project name in the "Repository Structure" or "Project Inventory" section
      - If project is listed with status "not setup yet":
        - Use `Edit` tool to change status from "not setup yet" to "ContextKit-enabled"
        - Update the setup status count (e.g., "2 of 21 projects have ContextKit enabled" → "3 of 21 projects have ContextKit enabled")
      - If project not listed in workspace: Use `Edit` tool to add project to the repository structure with "ContextKit-enabled" status and detected component details

26. **Display Completion**
    - Display success message using template below
    - Include summary of components discovered and validated
    - Suggest next steps based on project analysis findings

## Success Message Template

```
🎉 ContextKit initialization complete!

📊 Project Analysis Results:
   • [X] components/repositories discovered and analyzed
   • [Y] validated build commands documented
   • [Z] validated test commands documented
   • [W] dependencies analyzed across components

📁 Project configured with:
   ✓ Context.md - Comprehensive project analysis with validated build/test commands
   ✓ Context/Features/ - Systematic feature development
   ✓ Context/Backlog/ - Ideas and bugs with evaluation frameworks
   ✓ Context/Decisions/ - Architecture Decision Records (ADRs)
   ✓ Context/Guidelines/ - Development standards relevant to project type
   ✓ Context/Scripts/ - Code formatting and status automation
   ✓ .claude/commands/ctxk/ - Workflow commands (plan/, impl/, bckl/) - global proj/ commands remain global
   ✓ .claude/agents/ctxk/ - Quality assurance specialists
   ✓ .claude/settings.json - ContextKit permissions, hooks, and model configuration
   ✓ Status line configured - 5h-usage tracking with colored progress bars
   [For Swift projects: ✓ Formatter configurations (.swift-format, .swiftformat)]

🚀 Ready to start systematic development:

💡 **Tip**: Disable Auto-Compact for better control! Type `/config` and set "Auto-compact" to **false**.
   Auto-compact triggers at ~85% context, often interrupting when you're nearly finished.
   Better workflow: Start fresh chats when needed and resume with /ctxk:impl:start-working (within feature branches).

🎯 **Next Steps**:
   • All build/test commands are documented and validated in Context.md
   • Begin your first feature with: /ctxk:plan:1-spec
   • The systematic workflow: plan → implement → iterate

> [!IMPORTANT]
> **🔄 RESTART REQUIRED**: You must restart Claude Code for all commands to be available:
>
> 1. Type `/exit` to close this session
> 2. Type `claude` to start a new session

💡 **Available Commands**:
   • Feature Planning: /ctxk:plan:1-spec → /ctxk:plan:2-research-tech → /ctxk:plan:3-steps
   • Development: /ctxk:impl:start-working (after completing planning phases on feature branch)
   • Backlog: /ctxk:bckl:add-idea, /ctxk:bckl:add-bug
```

## Error Conditions

- **"ContextKit not installed globally"** → Run global installation first: `curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh`
- **"Project already initialized"** → Use `/ctxk:proj:migrate` for updates instead
- **"Not in git repository"** → Warn user, ask for confirmation to continue
- **"Uncommitted changes detected"** → Recommend committing first, allow override
- **"Permission denied"** → Check directory permissions and ownership
- **"Project type unclear"** → Interactive selection required from user
- **"Template copy failed"** → Check global ContextKit installation integrity
- **"Context.md generation failed"** → Verify template files exist and are readable
- **"Verification failed"** → Check if all required directories and files were created

## Validation Gates

**Pre-Setup Validation:**
- ContextKit globally installed and accessible?
- Project not already initialized with ContextKit?
- Git repository status acceptable or user confirmed?

**Critical Settings Configuration (HIGHEST PRIORITY):**
- Claude Code settings.json installed/updated with ContextKit permissions immediately?
- Full permissions obtained for remaining operations?

**User Configuration Validation (Sequential Questions):**
- Model setting configured based on user preference?
- Status line setup completed with plan parameter if user agreed?
- Workspace inheritance discovered and configured if applicable?
- All configuration applied successfully to settings.json?

**Template Installation Validation:**
- All template directories created successfully?
- Command templates copied to .claude/commands/ctxk/?
- Agent templates copied to .claude/agents/ctxk/?
- Script templates copied to Context/Scripts/?
- Backlog templates copied to Context/Backlog/?
- Relevant development guidelines copied to Context/Guidelines/?

**Deep Project Investigation Validation:**
- All project components/repositories discovered recursively?
- Each component analyzed for purpose, tech stack, and build system?
- Build commands discovered and validated with timeout for each component?
- Test commands discovered and validated with timeout for each component?
- Dependencies analyzed and documented for each component?
- File structure mapped for each component?
- Code style patterns detected from actual source files?
- Component hierarchy and relationships documented?

**Context Integration Validation:**
- Workspace context discovered and integrated?
- CLAUDE.md exists and references both project Context.md AND workspace Context.md (if found)?
- Project Context.md generated with comprehensive component analysis?
- All findings based on actual investigation, not assumptions?
- Validated build/test commands documented for each component?
- Project-specific formatters copied (if applicable)?

**Final Verification:**
- All critical files exist and contain expected content?
- Status line and settings properly configured for ContextKit workflow?

## Integration Points

- **Global ContextKit**: Reads from ~/.ContextKit/ template infrastructure
- **Workspace Inheritance**: Discovers and loads configuration from parent directory Context.md files
- **Team Collaboration**: Creates committable .claude/ directory for team sharing
- **Development Workflow**: Integrates with `/ctxk:plan:*`, `/ctxk:impl:*`, and `/ctxk:bckl:*` commands
- **Quality Assurance**: Connects hooks and agents to development process


════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit updates.
Add project-specific setup customizations below.

## Additional Setup Steps
<!-- Add extra steps like Docker configs, additional formatters, or CI/CD files -->

## Skip or Override Steps
<!-- Document workflow modifications like skipping workspace discovery or using custom locations -->

## Custom Template Locations
<!-- Define alternative sources like company-specific templates or team workflows -->