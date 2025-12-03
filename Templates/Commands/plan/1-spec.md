# Create Feature Specification
<!-- Template Version: 15 | ContextKit: 0.2.0 | Updated: 2025-12-03 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Initialize feature specification by validating setup, confirming feature naming, copying specification template, and executing template workflow with progress tracking.

## Execution Flow (main)

### Phase 0: Check Customization

0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
   - Use `Grep` tool to find the start of the section
   - Read everything below that line contained in this document til the end of the file
   - Make sure to consider what was said there with high priority
   - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"

### Phase 1: Setup Validation & Prerequisites

1. **Check Project Setup**
   - Use `Glob` tool to verify Context.md exists: `Glob . Context.md`
   - If Context.md missing:
     ```
     ❌ ContextKit not initialized in this project!

     Run /ctxk:proj:init first to setup ContextKit in this project.
     This command requires project context to detect tech stack and apply
     appropriate constitutional principles.
     ```
     → END (exit with error)

### Phase 2: Interactive Feature Definition & Naming

2. **Check Git Status**
   ```bash
   git status --porcelain || echo "⚠️ Git not available - continuing without version control"
   ```
   - If uncommitted changes exist:
     - Display warning in chat:
       ```
       ═══════════════════════════════════════════════════
       ⚠️ WARNING - Uncommitted Changes Detected
       ═══════════════════════════════════════════════════

       You have uncommitted changes in your working directory.
       It's recommended to commit these changes before creating a new feature branch.

       Run: git add . && git commit -m "Your commit message"

       ═══════════════════════════════════════════════════
       ```
     - Use AskUserQuestion tool with these parameters:
       ```json
       {
         "questions": [
           {
             "question": "Continue creating feature branch with uncommitted changes?",
             "header": "Git Status",
             "options": [
               {
                 "label": "No, commit first",
                 "description": "Exit and commit changes before creating feature branch (recommended)"
               },
               {
                 "label": "Yes, continue",
                 "description": "Proceed with feature branch creation despite uncommitted changes"
               }
             ],
             "multiSelect": false
           }
         ]
       }
       ```
     - Wait for user response
     - If user selects "No, commit first": EXIT with recommendation
     - If user selects "Yes, continue": Continue with warning logged

3. **Get Feature or App Description from User**
   - Ask user for feature/app description via text input
   - Wait for user input
   - **CRITICAL**: Store description exactly verbatim for specification Input field - do NOT summarize or paraphrase
   - Continue with description-based processing

4. **Discover Available Components and Ask User Which Are Affected**
   - Use `Bash` tool to check for multi-component structure:
     ```bash
     find . -maxdepth 3 -name ".git" -type d
     ```
   - Use `Bash` tool to check for submodules:
     ```bash
     ls -la .gitmodules 2>/dev/null || echo "No .gitmodules file found"
     ```
   - **If multiple components found**:
     - List all discovered repositories/components
     - Use AskUserQuestion tool with these parameters (dynamically populate options based on discovered components):
       ```json
       {
         "questions": [
           {
             "question": "Which components will be affected by this feature?",
             "header": "Components",
             "options": [
               {
                 "label": "Root only",
                 "description": "Root workspace repository only"
               },
               {
                 "label": "All components",
                 "description": "All discovered repositories and submodules"
               },
               {
                 "label": "[Component1]",
                 "description": "[Component1 description or path]"
               },
               {
                 "label": "[Component2]",
                 "description": "[Component2 description or path]"
               }
             ],
             "multiSelect": true
           }
         ]
       }
       ```
     - Wait for user response
     - Parse user selections and store affected components list for later use
   - **If single repository**: Automatically set affected components to "root" only

5. **Generate Names**
   - Parse user description for key concepts
   - Create PascalCase name (e.g., "user authentication" → "UserAuthentication", "recipe app" → "RecipeApp")
   - Create kebab-case name for branch suffix (e.g., "user-authentication", "recipe-app")
   - Focus on user value, not implementation details

6. **Interactive Name Confirmation**
   - Display generated names to user in a summary
   - Use AskUserQuestion tool with these parameters:
     ```json
     {
       "questions": [
         {
           "question": "Are these generated names correct? (Feature folder: [XXX]-[PascalCaseName], Git branch: feature/[XXX]-[kebab-case-name])",
           "header": "Names OK?",
           "options": [
             {
               "label": "Yes, looks good",
               "description": "Approve these names and proceed with feature creation"
             },
             {
               "label": "No, revise names",
               "description": "Provide alternative description to regenerate names"
             }
           ],
           "multiSelect": false
         }
       ]
     }
     ```
   - Wait for user response
   - If user selects "No, revise names": Use text input to ask for alternative description, regenerate names, and ask again
   - Continue only after user selects "Yes, looks good"
   - Store confirmed names for subsequent steps

7. **Present Understanding Summary & Get Confirmation**
   - Based on user's original description, generate CONCISE understanding summary
   - Display summary in chat:
     ```
     ═══════════════════════════════════════════════════
     📋 UNDERSTANDING CONFIRMATION
     ═══════════════════════════════════════════════════

     Before creating the specification, let me confirm my understanding:

     [1-2 paragraph summary of what the feature does and why]

     IN SCOPE ✅
     • [Key item 1 that will be addressed]
     • [Key item 2 that will be addressed]
     • [Key item 3 that will be addressed]
     (3-5 items maximum - keep concise for quick review)

     OUT OF SCOPE ❌
     • [Related item 1 that won't be included]
     • [Related item 2 that won't be included]
     • [Related item 3 that won't be included]
     (3-5 items maximum - clear boundaries)

     KEY EDGE CASES 🔍
     • [Important edge case 1 to consider]
     • [Important edge case 2 to consider]
     (2-3 items maximum - most critical ones)

     ═══════════════════════════════════════════════════
     ```
   - **CRITICAL**: Keep this concise for quick developer review
   - Use AskUserQuestion tool with these parameters:
     ```json
     {
       "questions": [
         {
           "question": "Does this understanding match your intent for the feature?",
           "header": "Understand?",
           "options": [
             {
               "label": "Yes, correct",
               "description": "Understanding is accurate, proceed with specification creation"
             },
             {
               "label": "No, needs changes",
               "description": "Provide corrections to adjust the understanding"
             }
           ],
           "multiSelect": false
         }
       ]
     }
     ```
   - Wait for user response
   - If user selects "No, needs changes": Ask for corrections via "Other" option, update understanding, and present again
   - Continue only after user selects "Yes, correct"
   - **Store confirmed understanding** for Spec.md generation (full detailed spec will be created from this)

### Phase 3: Template Setup & Execution

8. **Generate Sequential Feature Number & Create Workspace**
   ```bash
   # Find highest existing number in Context/Features/ (handles both files and folders with same prefix)
   HIGHEST=$(ls -1 Context/Features/ 2>/dev/null | grep -E '^[0-9]{3}-' | sed 's/^\([0-9]\{3\}\)-.*/\1/' | sort -n | tail -1)
   if [ -z "$HIGHEST" ]; then
     NEXT_NUM="001"
   else
     NEXT_NUM=$(printf "%03d" $((10#${HIGHEST} + 1)))
   fi
   NUMBERED_FEATURE_NAME="${NEXT_NUM}-[ConfirmedFeatureName]"
   mkdir -p Context/Features/${NUMBERED_FEATURE_NAME}
   echo "✅ Created feature directory: Context/Features/${NUMBERED_FEATURE_NAME}"
   ```
   - Store the numbered directory name for use in subsequent steps and success message

9. **Copy Feature Template**
   ```bash
   cp ~/.ContextKit/Templates/Features/Spec.md Context/Features/[numbered-feature-directory]/Spec.md
   echo "✅ Copied specification template"
   ```

10. **Create Git Branch in Current Directory**
    ```bash
    git checkout -b feature/${NEXT_NUM}-[confirmed-kebab-case-name] || echo "⚠️ Git branch creation failed - continuing without branch"
    echo "✅ Created git branch: feature/${NEXT_NUM}-[confirmed-kebab-case-name]"
    ```

11. **Create Branches in Additional Components (AI Manual Step)**
    - **For each additional component selected by user in Step 5** (if any beyond "root"):
      - Use `Bash` tool to change to component directory and create branch:
        ```bash
        cd [component-directory] && git checkout -b feature/${NEXT_NUM}-[confirmed-kebab-case-name] && echo "✅ Created branch in [component-directory]" && cd - || echo "⚠️ Branch creation failed in [component-directory]"
        ```
      - Repeat for each selected component
    - **If user selected "all" in Step 5**: Execute above for every discovered component
    - **If user selected "root" only in Step 5**: Skip this step entirely

12. **Execute Specification Template**
    - Use `Read` tool to read the copied Spec.md: `Read Context/Features/[numbered-feature-directory]/Spec.md`
    - Follow the **system instructions** section (boxed area) step by step
    - The template contains specification generation logic and progress tracking
    - Use tools (`Read`, `Edit`) as directed by the template instructions
    - **Template execution**: The copied Spec.md handles all context reading, guidelines loading, constitutional validation, and content generation
    - **IMPORTANT**: Use confirmed understanding from Step 7 to inform spec generation
    - **Progress tracking**: User can see checkboxes being completed in the copied file

13. **Extract and Resolve Clarification Points Interactively**
    - Use `Grep` tool to find clarification markers in final Spec.md: `Grep "🚨 \\[NEEDS CLARIFICATION:" [numbered-feature-directory]/Spec.md`
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
        - If user selects a suggested answer: Use that answer and replace 🚨 marker in Spec.md
        - If user provides custom answer via "Other": Use that answer and replace 🚨 marker in Spec.md
        - If user selects "Skip for now": Leave marker in place and continue to next
        - Continue to next clarification point
      - After all clarifications processed: confirm how many markers were resolved vs remaining

14. **Display Success Message** (see Success Messages section)

## Error Conditions

- **"Context.md not found"** → User must run `/ctxk:proj:init` to initialize ContextKit
- **"Feature template not found"** → Ensure template files are available
- **"Directory creation failed"** → Check permissions and disk space
- **"Template copy failed"** → Check file permissions
- **"Template execution failed"** → Verify Spec.md template contains system instructions section

## Validation Gates

- Project Context.md exists (ContextKit project setup complete)?
- User confirmation obtained for feature naming?
- Understanding summary presented in chat and confirmed by user?
- Feature workspace directory created successfully?
- Specification template copied to feature directory?
- Template system instructions executed successfully?
- Confirmed understanding used to inform spec generation?
- System instructions section removed from final Spec.md?
- Clarification points resolved interactively one at a time?
- User informed to review and commit specification before proceeding?

## Integration Points

- **Global ContextKit**: Uses Templates/Features/Spec.md template for specification generation
- **Project Setup**: Requires Context.md created by /ctxk:proj:init for project detection and context
- **Template Execution**: Delegates all specification logic to copied Spec.md template (follows init-workspace pattern)
- **Development Workflow**: Creates foundation for /ctxk:plan:2-research-tech technical planning phase
- **Team Collaboration**: Creates committed specification for team review and stakeholder validation
- **Git Integration**: Establishes feature branch for systematic development workflow
- **Workspace Integration**: Template inherits coding standards and constitutional overrides from workspace Context.md

## Success Messages

### Specification Created Successfully
```
🎉 Specification created successfully!

📁 Feature: [numbered-feature-directory-name]
✅ Created: [numbered-feature-directory]/Spec.md
✅ Git branch: feature/[XXX]-[confirmed-kebab-case-name]
✅ Branch created in selected affected components
✅ Applied constitutional principles from project guidelines
✅ All mandatory sections completed with project-specific content

✅ All specification clarifications resolved interactively during generation

🔗 Next Steps:
1. Review [numbered-feature-directory]/Spec.md to ensure it matches your intent
2. [If clarifications needed:] Edit the spec file to answer marked questions
3. When satisfied with the spec: commit your changes with git
4. Run /ctxk:plan:2-research-tech to proceed with technical research and architecture planning

💡 Specification ready for your review and approval before technical planning!
```

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Custom Feature Examples
<!-- Add examples of feature/app descriptions that work well with your project type -->

## Naming Overrides
<!-- Document project-specific naming conventions or automatic name generation rules -->

## Validation Rules
<!-- Add extra specification validation steps or quality gates specific to your project -->