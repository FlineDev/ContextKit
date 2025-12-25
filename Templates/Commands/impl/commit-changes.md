# Commit Changes
<!-- Template Version: 11 | ContextKit: 0.2.0 | Updated: 2025-12-24 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Delegate to specialized commit-changes agent for intelligent git analysis, commit message generation, and commit execution with comprehensive validation.

## Execution Flow (main)

0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
   - Use `Grep` tool to find the start of the section
   - Read everything below that line contained in this document til the end of the file
   - Make sure to consider what was said there with high priority
   - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"

1. **Launch Commit Agent**
   - Use `Task` tool to launch `commit-changes` agent with no additional parameters
   - Agent handles all git analysis, formatting, message generation, and commit execution
   - Agent provides structured summary of committed changes

2. **Forward Agent Response Exactly - NO ADDITIONAL TEXT**
   - **CRITICAL**: Display the agent's response exactly as received, without any modification or interpretation
   - **FORBIDDEN**: Do NOT add your own summary, interpretation, preamble, or postamble
   - **FORBIDDEN**: Do NOT add phrases like "Here's the commit result:" or "The agent completed successfully"
   - **FORBIDDEN**: Do NOT reformat or restructure the agent's output in any way
   - **OUTPUT ONLY**: The agent's raw response and nothing else
   - The agent already provides the complete structured response in the correct format:
     ```
     ✅ Successfully committed changes

     📝 Commit: [commit_hash]
     💬 Message: "[commit_message]"
     📂 Files: [number] files modified
     📊 Changes: +[lines_added] -[lines_deleted]
     ```

## Error Conditions

- **Agent not available** → Ensure ContextKit agents are set up with `/ctxk:proj:init`
- **Git repository issues** → Agent will handle and report git-related errors
- **Permission problems** → Agent will diagnose and suggest solutions

## Integration Points

- **Quality Agents**: Works with other ContextKit agents for comprehensive development workflow
- **Project Setup**: Requires `/ctxk:proj:init` to install the commit-changes agent
- **Git Workflow**: Integrates with feature branch development and task completion
- **ADR System**: Commit message may reference ADR numbers when changes involve documented decisions

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Custom Agent Parameters
<!-- Add project-specific parameters to pass to the commit-changes agent -->

## Pre-Commit Hooks
<!-- Document any project-specific pre-commit requirements -->