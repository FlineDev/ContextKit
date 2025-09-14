# Create Task List
<!-- Template Version: 0 | ContextKit: 0.0.0 | Updated: 2025-09-13 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Generate implementation task breakdown by detecting current feature, validating prerequisites, copying steps template, and executing template workflow with S### task enumeration and parallel execution planning.

## User Input Format

```
═══════════════════════════════════════════════════
║ ❓ USER INPUT REQUIRED - [Topic]
═══════════════════════════════════════════════════
║
║ [Question and context]
║
║ [Response instruction]
```

## Execution Flow (main)

### Phase 1: Setup Validation & Prerequisites

1. **Check Project Setup**
   - Use `Glob` tool to verify Context.md exists: `Glob . Context.md`
   - If Context.md missing:
     ```
     ❌ ContextKit not initialized in this project!

     Run /ctxk:proj:init first to setup ContextKit in this project.
     This command requires project context to detect tech stack and apply
     appropriate development guidelines.
     ```
     → END (exit with error)

2. **Verify ContextKit Global Installation**
   ```bash
   ls -la ~/.ContextKit/Templates/Features/Steps.md || echo "❌ ContextKit not installed globally. Run: curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh"
   ```

### Phase 2: Feature Detection & Validation

3. **Detect Current Feature**
   - Use `Bash` tool to check current git branch: `git branch --show-current`
   - If on feature/[name] branch: Extract feature name from branch
   - If not on feature branch: Ask user which feature to work on using consistent format
   - Verify feature directory exists: `Glob Context/Features/[FeatureName] .`

4. **Validate Prerequisites**
   - Use `Read` tool to check Spec.md exists: `Read Context/Features/[FeatureName]/Spec.md`
   - Use `Read` tool to check Tech.md exists: `Read Context/Features/[FeatureName]/Tech.md`
   - If either missing:
     ```
     ❌ Prerequisites not complete!

     Both business specification and technical architecture are required:
     - Run /ctxk:plan:1-spec if Spec.md is missing
     - Run /ctxk:plan:2-tech if Tech.md is missing

     Implementation planning requires both completed phases as input.
     ```
     → END (exit with error)
   - Check for [NEEDS CLARIFICATION] markers in both files
   - If clarifications exist: WARN user to resolve them first

### Phase 3: Template Setup & Execution

5. **Copy Steps Template**
   ```bash
   cp ~/.ContextKit/Templates/Features/Steps.md Context/Features/[FeatureName]/Steps.md
   echo "✅ Copied implementation steps template"
   ```

6. **Execute Steps Template**
   - Use `Read` tool to read the copied Steps.md: `Read Context/Features/[FeatureName]/Steps.md`
   - Follow the **system instructions** section (boxed area) step by step
   - The template contains task generation logic with S### enumeration and parallel markers
   - Use tools (`Read`, `Edit`) as directed by the template instructions
   - **Template execution**: The copied Steps.md handles all task breakdown, dependency analysis, and parallel execution planning
   - **Progress tracking**: User can see checkboxes being completed in the copied file

7. **Display Success Message** (see Success Messages section)

## Error Conditions

- **"Context.md not found"** → User must run `/ctxk:proj:init` to initialize ContextKit
- **"ContextKit not installed globally"** → Run installation: `curl -fsSL https://raw.githubusercontent.com/FlineDev/ContextKit/main/install.sh | sh`
- **"Prerequisites not complete"** → Must run `/ctxk:plan:1-spec` and `/ctxk:plan:2-tech` first
- **"Steps template not found"** → Check global ContextKit installation integrity
- **"Unresolved clarifications exist"** → Resolve [NEEDS CLARIFICATION] markers in Spec.md and Tech.md first
- **"Template execution failed"** → Verify Steps.md template contains system instructions section


## Validation Gates

- ContextKit globally installed and accessible?
- Project Context.md exists (ContextKit project setup complete)?
- Both Spec.md and Tech.md prerequisites exist and are complete?
- No unresolved [NEEDS CLARIFICATION] markers in prerequisite files?
- Steps template copied to feature directory successfully?
- Template system instructions executed successfully?
- System instructions section removed from final Steps.md?
- User informed to review and commit implementation plan before proceeding?

## Integration Points

- **Global ContextKit**: Uses Templates/Features/Steps.md template for implementation task generation
- **Project Setup**: Requires Context.md created by /ctxk:proj:init for project detection and context
- **Template Execution**: Delegates all task logic to copied Steps.md template (follows init-workspace pattern)
- **Development Workflow**: Creates foundation for /ctxk:impl:start-working development execution phase
- **Team Collaboration**: Creates committed implementation plan for team review and development coordination
- **Git Integration**: Works within existing feature branch for systematic development workflow
- **Workspace Integration**: Template inherits coding standards and constitutional overrides from workspace Context.md

## Success Messages

### Implementation Steps Created Successfully
```
🎉 Implementation task breakdown created successfully!

✅ Created: Context/Features/[Name]/Steps.md
✅ Generated S### task enumeration with parallel execution markers
✅ All mandatory phases completed with dependency analysis

[If NEEDS CLARIFICATION items exist in steps:]
⚠️  Implementation clarifications needed for:
• [Template will list specific implementation questions that need answers]

🔗 Next Steps:
1. Review Context/Features/[Name]/Steps.md to ensure task breakdown is comprehensive
2. [If clarifications needed:] Edit the steps file to resolve marked implementation questions
3. When satisfied with the implementation plan: commit your changes with git
4. Run /ctxk:impl:start-working (in a new chat) to begin systematic development execution

💡 Implementation roadmap ready for development execution!
```


════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Instructions

<!-- Add any project-specific guidance for task breakdown and step creation here -->

## Additional Examples

<!-- Add examples of task breakdown patterns that work well with your project -->

## Override Behaviors

<!-- Document any project-specific task organization overrides here -->