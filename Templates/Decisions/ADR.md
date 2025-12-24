# Architecture Decision Record Template
<!-- Template Version: 1 | ContextKit: 0.2.0 | Updated: 2025-12-24 -->

## Description
Template for creating Architecture Decision Records (ADRs) to document
significant architectural decisions and deviations from specifications.
ADRs provide a lightweight mechanism for capturing the context, decision,
and consequences of architecturally significant choices.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - ADR CREATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## When to Create an ADR
║
║ Create an ADR when:
║ - Making a significant architectural decision
║ - Deviating from the original Spec.md during implementation
║ - Choosing between multiple valid technical approaches
║ - Establishing a pattern that should be followed consistently
║ - Changing a previous decision (superseding an existing ADR)
║
║ ## Execution Flow (main)
║
║ ### Phase 1: Determine ADR Number
║
║ 1. **Find Next Available Number**
║    - Use `Glob` tool: `Glob Context/Decisions *.md`
║    - Extract highest existing NNNN prefix from filenames
║    - Increment by 1 for new ADR
║    - If no existing ADRs, start with 0001
║
║ ### Phase 2: Create ADR File
║
║ 2. **Copy Template**
║    - Create new file: `Context/Decisions/NNNN-decision-title.md`
║    - Use kebab-case for decision title (e.g., `0003-increase-power-up-duration.md`)
║    - Copy content from template section below
║
║ 3. **Fill Required Sections**
║    - **Status**: Set to "Accepted" for implementation decisions
║    - **Context**: Document the problem or situation
║    - **Decision**: State what was decided
║    - **Consequences**: List trade-offs and implications
║    - **Related**: Link to features, files, and superseded ADRs
║
║ ### Phase 3: Integration
║
║ 4. **Reference in Commit Message**
║    - Include "ADR-NNNN" in commit message for traceability
║    - Example: "feat: increase power-up duration (ADR-0003)"
║
║ 5. **Update Spec.md Revision History (if deviation)**
║    - If ADR documents a deviation from Spec.md
║    - Add entry to Spec.md Revision History section
║    - Format: `| Date | Change Description | ADR-NNNN |`
║
════════════════════════════════════════════════════════════════════════════════

---

## ADR Template Content

Copy the content below when creating a new ADR:

---

# ADR-NNNN: [Decision Title]

## Status
[Proposed | Accepted | Deprecated]

## Context
[What is the issue or situation that motivated this decision?]

[If this is a deviation from specification, reference the original requirement:]
[See Context/Features/###-FeatureName/Spec.md Section X.Y]

## Decision
[What was decided?]

[Include specific details:]
- [Specific choice or value]
- [Implementation approach]
- [Patterns to follow]

## Consequences

**Benefits:**
- [What becomes easier or better?]

**Trade-offs:**
- [What becomes more difficult?]
- [What are we giving up?]

**Risks:**
- [What could go wrong?]

## Related

- **Supersedes**: [ADR-NNNN, ADR-MMMM - if this decision replaces previous ones, leave empty otherwise]
- **Feature**: [Context/Features/###-FeatureName/]
- **Files Affected**: [src/path/to/file.ext, src/other/file.ext]
- **Spec Section**: [Context/Features/###-FeatureName/Spec.md Section X.Y - if deviation]

---

## Error Conditions

- **"No Context/Decisions/ directory"** → Create directory with `mkdir -p Context/Decisions`
- **"ADR number conflict"** → Re-check Glob results, use next available number
- **"Missing context section"** → ADR incomplete, add problem description

## Integration Points

- **Planning Commands**: `/ctxk:plan:*` commands load existing ADRs for context
- **Implementation**: `/ctxk:impl:start-working` suggests ADR creation on deviations
- **Quality Agents**: `check-task-completion` verifies ADRs exist for deviations
- **Commit Workflow**: ADR numbers referenced in commit messages

## Success Messages

### ADR Created
```
✅ ADR-NNNN created: Context/Decisions/NNNN-decision-title.md

📋 Decision documented:
   Status: Accepted
   Title: [Decision Title]
   Supersedes: [Previous ADRs if any]

💡 Remember to reference ADR-NNNN in your commit message.
```

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific ADR Categories
<!-- Define categories if useful for your project: Architecture, API, Dependencies, Performance, Security, etc. -->

## Additional Required Sections
<!-- Add any project-specific sections that all ADRs should include -->

## ADR Review Process
<!-- Document any team review requirements before ADRs are accepted -->

## Override Behaviors
<!-- Document any project-specific exceptions to these guidelines -->
