# Create Task List
<!-- Template Version: 8 | ContextKit: 0.2.0 | Updated: 2025-12-24 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Generate implementation task breakdown by detecting current feature, validating prerequisites, copying steps template, and executing template workflow with S### task enumeration and parallel execution planning.

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

2. **Validate Prerequisites**
   - Use `Bash` tool to check planning files exist:
     ```bash
     ls [numbered-feature-directory]/Spec.md [numbered-feature-directory]/Tech.md
     ```
   - If any missing:
     ```
     ❌ Prerequisites not complete!

     All planning phases are required for implementation:
     - Run /ctxk:plan:1-spec if Spec.md is missing
     - Run /ctxk:plan:2-research-tech if Tech.md is missing

     Implementation planning requires completed specification and technical planning.
     ```
     → END (exit with error)

2.5 **Load ADR Context**
    - Use `Glob Context/Decisions *.md` to find existing Architecture Decision Records
    - If ADRs found:
      - Understand patterns established in previous features
      - Reference ADRs when creating tasks that follow established patterns
      - If feature will deviate from Spec.md or establish new patterns, include ADR creation task

### Phase 2: Template Setup & Execution

3. **Copy Steps Template**
   ```bash
   cp ~/.ContextKit/Templates/Features/Steps.md [numbered-feature-directory]/Steps.md
   echo "✅ Copied implementation steps template"
   ```

4. **Execute Steps Template**
   - Use `Read` tool to read the copied Steps.md: `Read [numbered-feature-directory]/Steps.md`
   - Follow the **system instructions** section (boxed area) step by step
   - The template contains task generation logic with S### enumeration and parallel markers
   - Use tools (`Read`, `Edit`) as directed by the template instructions
   - **Template execution**: The copied Steps.md handles all task breakdown, dependency analysis, and parallel execution planning
   - **Progress tracking**: User can see checkboxes being completed in the copied file
   - **ADR Integration**: When generating validation tasks, include:
     - ADR review task: Verify all deviations from Spec.md documented in ADRs
     - Task completion validation: Include check-task-completion agent at milestones

5. **Extract and Resolve Clarification Points Interactively**
   - Use `Grep` tool to find clarification markers in Steps.md: `Grep "🚨 \\[NEEDS CLARIFICATION:" [numbered-feature-directory]/Steps.md`
   - If clarification points found:
     - Parse each clarification point to extract the specific question and line context
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
       - If user selects a suggested answer: Use that answer and replace 🚨 marker in Steps.md
       - If user provides custom answer via "Other": Use that answer and replace 🚨 marker in Steps.md
       - If user selects "Skip for now": Leave marker in place and continue to next
       - Continue to next clarification point
     - After all clarifications processed: confirm how many markers were resolved vs remaining

6. **Display Success Message** (see Success Messages section)

## Error Conditions

- **"Prerequisites not complete"** → Must run `/ctxk:plan:1-spec` and `/ctxk:plan:2-research-tech` first
- **"Steps template not found"** → Ensure template files are available
- **"Template execution failed"** → Verify Steps.md template contains system instructions section

## Integration Points

- **Global ContextKit**: Uses Templates/Features/Steps.md template for implementation task generation
- **Project Setup**: Requires Context.md created by /ctxk:proj:init for project detection and context
- **Template Execution**: Delegates all task logic to copied Steps.md template (follows init-workspace pattern)
- **Development Workflow**: Creates foundation for /ctxk:impl:start-working development execution phase
- **Team Collaboration**: Creates committed implementation plan for team review and development coordination
- **Git Integration**: Works within existing feature branch for systematic development workflow
- **Workspace Integration**: Template inherits coding standards and constitutional overrides from workspace Context.md
- **ADR System**: Loads existing ADRs to inform task generation; includes ADR creation tasks when patterns established
- **Validation Agent**: Integrates check-task-completion agent at milestone markers

## Success Messages

### Implementation Steps Created Successfully
```
🎉 Implementation task breakdown created successfully!

✅ Created: [numbered-feature-directory]/Steps.md
✅ Generated S### task enumeration with parallel execution markers
✅ All mandatory phases completed with dependency analysis

✅ All implementation clarifications resolved interactively during generation

🔗 Next Steps:
1. Review [numbered-feature-directory]/Steps.md to ensure task breakdown is comprehensive
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