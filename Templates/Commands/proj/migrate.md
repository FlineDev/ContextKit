# Upgrade to Latest
<!-- Template Version: 15 | ContextKit: 0.2.0 | Updated: 2025-12-11 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Description
Update ContextKit templates to latest versions while preserving user customizations.

**Key Features:**
- **Parallel Version Checking**: Uses Task tool with subagents to check all template versions simultaneously for maximum speed
- **Smart Merge Logic**: Only processes files that actually need updates (newer template versions)
- **Comprehensive Preservation**: Always maintains all user content below "👩‍💻 DEVELOPER CUSTOMIZATIONS" sections

Updates both:
- **Global project management commands** (proj/) in ~/.claude/commands/ctxk/proj/
- **Local project templates** (plan/, impl/, bckl/, agents, scripts, etc.) in current project

All updates preserve user customizations in "👩‍💻 DEVELOPER CUSTOMIZATIONS" sections.

## Execution Flow (main)

### Phase 0: Check Customization

0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
   - Use `Grep` tool to find the start of the section
   - Read everything below that line contained in this document til the end of the file
   - Make sure to consider what was said there with high priority
   - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"

### Phase 1: Automated Global Update & Version Scanning

1. **Comprehensive ContextKit Update & Analysis**
   - Use Bash tool: `Context/Scripts/VersionStatus.sh --verbose`
   - Capture stderr output to see OUTDATED and NEW file listings
   - Status messages go to stdout, file data goes to stderr

2. **Early Exit Check: Already Up to Date**
   - If stderr output contains no OUTDATED or NEW lines:
     - Display message: "✅ **Migration Complete**: All ContextKit templates are already up to date. No changes needed."
     - **EXIT IMMEDIATELY** - do not proceed to Phase 2 or any further processing
     - This is a successful completion, not an error

3. **Automated File Updates** (only if updates found)
   - Parse captured stderr output from VersionStatus.sh
   - For each line with format `OUTDATED:source_path:target_path` or `NEW:source_path:target_path`:
   - Use Bash tool: `Context/Scripts/MergePreserve.sh source_path target_path`
   - **Handles automatically**:
     - ✅ Global repository update (git pull)
     - ✅ Version comparison for ALL template categories
     - ✅ Project compatibility validation
     - ✅ Automated file updates with customization preservation
   - **Handles both**: Global proj commands (~/.claude/commands/ctxk/proj/) AND local project templates
   - **Performance**: All previous Phase 1-3 work in ~35 seconds total
   - **Intelligence**: Script always preserves customization sections regardless of content

### Phase 2: Manual LLM Processing (Complex Cases Only) - SKIP IF NO UPDATES FOUND

#### Phase 2.1: Intelligent Settings.json Merge

1. Use Read tool to examine current .claude/settings.json
2. Use Read tool to read ~/.ContextKit/Templates/settings.json for latest template

3. StatusLine Configuration:
   - If user has statusLine setting with path containing "CustomStatusline.sh":
     - Check if path is correct (should be "./Context/Scripts/CustomStatusline.sh")
     - Check if command includes plan parameter (should have "--plan Pro|Max5|Max20")
     - If missing plan parameter: Use AskUserQuestion tool to ask user for their Claude plan and update command
     - If path incorrect: Update path to correct location using Edit tool
     - If both correct: No change needed
   - If user has no statusLine setting or different script: Skip (user opted out)

4. Model Setting:
   - Skip entirely - never update user's model preference

5. Permissions Array Merge:
   - Read current allow/deny arrays from user settings
   - Read template allow/deny arrays from ContextKit template
   - For allow list: Smart merge avoiding duplicates, keep alphabetically sorted
   - For deny list: Smart merge avoiding duplicates, keep alphabetically sorted
   - Use Edit tool to update only if arrays changed

6. Hooks Configuration:
   - Identify ContextKit hooks: PostToolUse="./Context/Scripts/AutoFormat.sh", SessionStart="./Context/Scripts/VersionStatus.sh"
   - Keep all user-specific hooks unchanged
   - Add missing ContextKit hooks
   - Update existing ContextKit hooks if paths changed
   - Remove only ContextKit hooks that no longer exist in template
   - Use Edit tool to update only if hooks changed

7. Track settings.json changes:
   - Add to UPDATED_FILES if any changes made
   - Add to WARNINGS if merge had issues

#### Phase 2.2: Other Complex Merge Cases

1. For each file needing update:
   - If new file: Use Bash tool cp to copy directly to project location
   - If existing file:
     - Use Read tool to examine project file
     - Use Grep tool to find "👩‍💻 DEVELOPER CUSTOMIZATIONS" line number
     - If separator found: Use Edit tool to merge (template above + user content below)
     - If separator missing: Use Bash tool cp to replace entirely
   - If settings.json: Use intelligent merge logic (see Phase 2.1)

2. Track results:
   - NEW_FILES: List of files copied
   - UPDATED_FILES: List of files merged with version info
   - WARNINGS: List of files skipped or issues encountered

### Phase 3: Summary Report - SKIP IF EARLY EXIT IN PHASE 1

Display results organized by:
- Global proj commands updated (count and version changes)
- Local project files updated (count and version changes)
- New files added (count and list)
- Settings.json merge results (if applicable)
- Warnings (count and descriptions)
- Overall status (complete with updates)
- Git review reminder: "Migration complete. Review changes with 'git status' and commit when ready."

**Note**: If Phase 1 early exit occurred (no updates needed), this phase is skipped entirely.

## Error Conditions

- **"Could not check for updates"** → No internet connection (continues with cached version)
- **"Missing customization section"** → User file corrupted, skipped with warning
- **"Template file not found"** → Template files not available

## Success Criteria

- [ ] Global ContextKit repository updated (or warning issued)
- [ ] Global proj commands updated preserving customizations
- [ ] All local project template files scanned for version differences
- [ ] Local workflow commands (plan/, impl/, bckl/) updated preserving customizations
- [ ] Agents, scripts, guidelines, and backlog templates updated
- [ ] Settings.json intelligently merged
- [ ] Summary report shows both global and local updates with warnings

---

**Status**: Production ready - Simple, reliable template synchronization with customization preservation

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add migration-specific customizations below.

## Custom Migration Steps
<!-- Add extra steps like CI/CD configs, custom agents, or company workflows -->

## Skip Migration Files
<!-- Document files to exclude like custom settings or company statuslines -->

## Custom Template Sources
<!-- Define alternative sources like company-specific templates or internal repositories -->