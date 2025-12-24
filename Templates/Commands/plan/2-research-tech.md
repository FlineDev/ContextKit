# Technical Planning: Research & Architecture
<!-- Template Version: 17 | ContextKit: 0.2.0 | Updated: 2025-12-24 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
**Single-run workflow**: Creates Tech.md containing both research findings and technical architecture in one continuous execution flow.

## Execution Flow (main)

### Phase 0: Check Customization

0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
   - Use `Grep` tool to find the start of the section
   - Read everything below that line contained in this document til the end of the file
   - Make sure to consider what was said there with high priority
   - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"

### Phase 1: Feature Detection & Validation

1. **Detect Current Feature**
   - Use `Bash` tool to check current git branch: `git branch --show-current`
   - If on feature/[prefix]-[name] branch: Extract feature name from branch
   - If not on feature branch: Use text input to ask user which feature to work on
   - Use `Glob` tool to find numbered feature directory: `Glob Context/Features/???-[FeatureName]`
   - Store the found directory path for use in subsequent steps

2. **Validate Prerequisites**
   - Use `Bash` tool to check Spec.md exists: `ls [numbered-feature-directory]/Spec.md`
   - If Spec.md missing:
     ```
     ❌ Feature specification not found!

     Run /ctxk:plan:1-spec first to create the business requirements.
     Technical planning requires completed specification as input.
     ```
     → END (exit with error)

2.5 **Load ADR Context**
    - Use `Glob Context/Decisions *.md` to find existing Architecture Decision Records
    - If ADRs found:
      - Understand architectural decisions already made
      - Identify constraints from previous choices
      - Technical choices in Tech.md must align with or explicitly supersede existing ADRs
      - Reference relevant ADRs in architecture section

### Phase 2: Template Execution

3. **Copy Technical Planning Template**
   ```bash
   cp ~/.ContextKit/Templates/Features/Tech.md [numbered-feature-directory]/Tech.md
   echo "✅ Copied technical planning template"
   ```

4. **Execute Technical Planning Template**
   - Use `Read` tool to read the **ENTIRE** copied Tech.md template: `Read [numbered-feature-directory]/Tech.md`
   - **CRITICAL**: The template contains 400+ lines with detailed system instructions - read it completely to understand all phases
   - **CRITICAL**: Follow the Tech.md template's **🤖 EXECUTION FLOW** instructions step by step:

   **Phase 1: Research & Knowledge Acquisition** (Steps 1-8 in Tech.md)
   - Load feature specification and project context
   - Identify research targets from specification
   - Launch codebase integration agent
   - Launch technology research agents using `Task` tool
   - Launch API research agents using `Task` tool
   - Launch architecture pattern research agents using `Task` tool
   - **CRITICAL**: Instruct ALL agents to RETURN findings as text responses, NOT create markdown files
   - **Wait for ALL agents to complete** before proceeding
   - Document all research findings in Research & Analysis section

   **Phase 2: Technical Architecture Design** (Steps 9-13 in Tech.md)
   - Load development guidelines
   - Apply Context/Guidelines compliance gates
   - Design iOS/macOS architecture with research-informed decisions
   - Generate implementation complexity assessment
   - Fill Technical Architecture section (referencing research section to avoid duplication)

   **Phase 3: Validation** (Steps 14-16 in Tech.md)
   - Execute validation steps to ensure research completeness and architecture quality

   **Phase 4: Completion** (Step 17 in Tech.md)
   - Use `Edit` tool to **remove the entire boxed system instructions section from the start of the file**
   - Verify final document contains both research AND architecture in single file

   **Template execution**: You must populate the Tech.md file with actual findings and architecture decisions

5. **Extract and Resolve Clarification Points Interactively**
   - Use `Grep` tool to find clarification markers in Tech.md: `Grep "🚨 \\[NEEDS CLARIFICATION:" [numbered-feature-directory]/Tech.md`
   - If clarification points found:
     - Parse each clarification point to extract the specific question, file location, and line context
     - **FOR EACH CLARIFICATION (one at a time)**:
       - Analyze the extracted clarification question and generate 2-4 reasonable answer suggestions based on context
       - Use AskUserQuestion tool with these parameters:
         ```json
         {
           "questions": [
             {
               "question": "[Extracted clarification question from 🚨 marker]",
               "header": "Answer?",
               "options": [
                 {
                   "label": "[Suggested answer 1]",
                   "description": "[Why this answer makes sense based on context]"
                 },
                 {
                   "label": "[Suggested answer 2]",
                   "description": "[Why this answer makes sense based on context]"
                 },
                 {
                   "label": "[Suggested answer 3 if applicable]",
                   "description": "[Why this answer makes sense based on context]"
                 },
                 {
                   "label": "Skip for now",
                   "description": "Leave this clarification marker for later resolution"
                 }
               ],
               "multiSelect": false
             }
           ]
         }
         ```
       - Wait for user response
       - If user selects a suggested answer: Use that answer and replace 🚨 marker in Tech.md
       - If user provides custom answer via "Other": Use that answer and replace 🚨 marker in Tech.md
       - If user selects "Skip for now": Leave marker in place and continue to next
       - Continue to next clarification point
     - After all clarifications processed: confirm how many markers were resolved vs remaining

6. **Display Success Message** (see Success Messages section)

## Error Conditions

- **"Feature specification not found"** → Must run `/ctxk:plan:1-spec` first
- **"Technical template not found"** → Ensure template files are available
- **"Template execution failed"** → Verify Tech.md template contains system instructions section
- **"Tech.md not populated"** → Research agents completed but findings not documented - must execute template's Phase 1 consolidation steps

## Integration Points

- **Global ContextKit**: Uses Templates/Features/Tech.md template for combined research and architecture planning
- **Project Setup**: Requires Context.md created by /ctxk:proj:init for project detection and context
- **Template Execution**: Delegates all technical logic to copied Tech.md template (follows init-workspace pattern)
- **Development Workflow**: Creates foundation for /ctxk:plan:3-steps implementation planning phase
- **Team Collaboration**: Creates committed technical plan for team review and development guidance
- **Git Integration**: Works within existing feature branch for systematic development workflow
- **Workspace Integration**: Template inherits coding standards and constitutional overrides from workspace Context.md
- **ADR System**: Loads existing ADRs to understand architectural constraints; technical choices must align with or supersede existing ADRs

## Success Messages

### Technical Planning Completed
```
🎉 Technical planning completed successfully!

✅ Created: Context/Features/[Name]/Tech.md
✅ Research & Analysis section populated with findings
✅ Technical Architecture section completed
✅ Applied Context/Guidelines standards
✅ All mandatory sections completed with research-informed decisions
✅ Template system instructions cleaned up

✅ All technical clarifications resolved interactively during generation

🔗 Next Steps:
1. Review Context/Features/[Name]/Tech.md to ensure:
   - Research findings are complete
   - Technical decisions are sound
   - Architecture references research appropriately
2. When satisfied with the technical plan: commit your changes with git
3. Run /ctxk:plan:3-steps to proceed with implementation task breakdown

💡 Single-file technical planning ready for implementation!
```

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Instructions

<!-- Add any project-specific guidance for technical planning here -->

## Additional Examples

<!-- Add examples of technical planning patterns that work well with your project -->

## Override Behaviors

<!-- Document any project-specific technical planning requirement overrides here -->
