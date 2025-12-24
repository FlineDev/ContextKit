---
meta: "Template Version: 1 | ContextKit: 0.2.0 | Updated: 2025-12-24"
name: check-task-completion
description: Validate task completion criteria at milestones, detecting stub implementations and missing ADRs
tools: Read, Grep, Glob
color: yellow
---

# Agent: check-task-completion

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.
>
> Found a bug or improvement for everyone? Please report it: https://github.com/FlineDev/ContextKit/issues

## Purpose

Validate that tasks meet Definition of Done criteria before milestone commits.
Analyze recent work against TaskCompletion.md guidelines and report violations.
Detect stub implementations, missing integration points, and undocumented deviations.

## Execution Flow (agent)

0. **Read the "👩‍💻 DEVELOPER CUSTOMIZATIONS" section**
   - Use `Grep` tool to find the start of the section
   - Read everything below that line contained in this document til the end of the file
   - Make sure to consider what was said there with high priority
   - If anything conflicts with the rest of the workflow, prioritize the "developer customizations"

### Phase 1: Load Context

1. **Load TaskCompletion Guidelines**
   - Use `Glob` to check: `Glob Context/Guidelines TaskCompletion.md`
   - If found: Use `Read` to load project-specific completion criteria
   - Extract validation checklist from Developer Customizations section
   - Note any project-specific red flags or requirements

2. **Load Existing ADRs**
   - Use `Glob` to find ADRs: `Glob Context/Decisions *.md`
   - Count existing ADRs for context
   - Note most recent ADR number for reference

### Phase 2: Analyze Recent Changes

3. **Identify Changed Files**
   - If FILES input provided: Parse provided file paths
   - Otherwise: Check git status for uncommitted changes
   - Focus on source files, exclude documentation-only changes

4. **Scan for Stub Patterns**
   - Use `Grep` to find stub indicators in changed files:
     - `// handled elsewhere` - Assumed integration
     - `// TODO:` or `// FIXME:` - Incomplete implementation
     - `// will implement` - Deferred work
     - Empty method bodies with only comments
   - Record each violation with file path and line number

5. **Scan for Integration Assumptions**
   - Use `Grep` to find patterns like:
     - Method calls to undefined methods
     - References to external systems without verification
     - `// connects to` or `// calls` comments without actual code
   - For each reference found, attempt to verify target exists

### Phase 3: Deviation Detection

6. **Compare with Spec.md**
   - Use `Glob` to find current feature: `Glob Context/Features/???-* Spec.md`
   - If feature Spec.md found, note key requirements
   - Flag significant changes that may need ADR documentation

7. **Check ADR Coverage**
   - For files with significant changes, check if ADR exists
   - Look for commit messages referencing ADR-NNNN
   - Flag potential undocumented deviations

### Phase 4: Generate Report

8. **Compile Validation Results**
   - Count violations by category:
     - Stub implementations
     - TODO/FIXME without follow-up tasks
     - Missing integration verification
     - Potential undocumented deviations
   - Determine overall status: PASS, FAIL, or WARNING

9. **Generate Report**
   - **If PASS**: Confirm all criteria met
   - **If FAIL**: List violations with actionable fixes
   - **If WARNING**: Note potential issues for review

## Stub Pattern Detection

### Patterns That Indicate Incomplete Work

```
// handled elsewhere
// handled by [something]
// TODO: implement
// FIXME:
// will implement later
// placeholder
// stub
// mock implementation
throw NotImplementedError
pass  # Python empty block
return nil // temporary
```

### Patterns That Are Acceptable

```
// TODO: tracked in Steps.md S###
// See ADR-NNNN for rationale
// Intentionally empty - no action needed
// Deprecated - see ADR-NNNN
```

## Report Formats

### Success Format
```
✅ Task Completion Validation PASSED

All criteria met:
- No stub implementations found
- Integration points verified
- ADRs exist for deviations (if any)

Files analyzed: [count]
Existing ADRs: [count]
```

### Failure Format
```
❌ Task Completion Validation FAILED

Issues found:
- File: src/services/DataManager.js:15
  Issue: Stub method "cleanup()" with "// handled elsewhere"
  Fix: Implement cleanup logic or remove if not needed

- File: src/components/Form.js:42
  Issue: TODO comment without follow-up task
  Fix: Create task in Steps.md or backlog, or implement now

- Deviation: Feature behavior differs from Spec.md Section 4.2
  Fix: Create ADR to document the deviation

Required actions before milestone commit:
1. Resolve stub implementations
2. Create ADRs for undocumented deviations
3. Re-run validation
```

### Warning Format
```
⚠️ Task Completion Validation: REVIEW NEEDED

Potential issues found:
- File: src/utils/helpers.js:88
  Warning: TODO comment - verify if task exists in backlog

Recommendation: Review flagged items before proceeding.
```

## Error Conditions

- **"No files to analyze"** → No changes detected, validation skipped
- **"TaskCompletion.md not found"** → Using default validation rules
- **"Context/Decisions/ not found"** → ADR tracking not initialized, recommend setup

## Integration Points

- **start-working.md**: Invokes this agent at milestone markers
- **commit-changes**: May block commit if validation fails
- **TaskCompletion.md**: Source of validation criteria
- **ADR.md**: Template for creating missing ADRs

## Success Messages

### All Clear
```
🎉 Validation complete - ready for milestone commit!
```

### Issues Resolved
```
✅ All issues resolved. Validation now passes.
```

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Stub Patterns
<!-- Add language/framework-specific stub patterns to detect -->
<!-- Example Swift: "fatalError(\"not implemented\")" -->
<!-- Example Python: "raise NotImplementedError" -->

## Integration Verification Exceptions
<!-- Document cases where assumed integrations are acceptable -->
<!-- Example: "External API calls mocked in development" -->

## Custom Validation Rules
<!-- Add any project-specific validation requirements -->
<!-- Example: "All new components must have accessibility labels" -->

## Override Behaviors
<!-- Document any project-specific exceptions to default rules -->
