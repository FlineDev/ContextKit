# Task Completion Guidelines
<!-- Template Version: 1 | ContextKit: 0.2.0 | Updated: 2025-12-24 -->

> [!WARNING]
> **👩‍💻 FOR DEVELOPERS**: Do not edit the content above the developer customization section - changes will be overwritten during ContextKit updates.
>
> For project-specific customizations, use the designated section at the bottom of this file.

## Overview

Strategic guidance for determining when implementation tasks are truly complete.
Focus on preventing partial implementations that compile but don't function.

This guideline addresses a common problem: tasks marked complete when code compiles,
but features are non-functional due to missing integration points or stub implementations.

---

## 1. Code Completeness

### ✅ Prefer: Verified Integration Points

- Integration points exist AND have been tested in real scenarios
- No "// handled elsewhere" comments without verified code at target location
- Manual testing confirms the feature actually works, not just compiles
- All method calls to external systems verified to exist and function
- Dependencies inject properly and produce expected results

### ❌ Avoid: Assumed Integrations

- Stub methods with comments assuming implementation exists elsewhere
- Code compiles but feature is non-functional when tested
- TODO comments without explicit follow-up tasks in Steps.md or backlog
- "Will connect this later" patterns without documented tasks
- Empty method bodies with "// handled by..." comments

**Example - Generic Pattern**:
```javascript
// ❌ Avoid - Assumed integration
class DataManager {
  invalidate(key) {
    // Invalidation handled by background task  ← Integration assumed but not verified
    this.markStale(key)
  }
}

// ✅ Prefer - Verified integration
class DataManager {
  invalidate(key) {
    this.markStale(key)
    this.scheduleCleanup()  // ← Method exists and has been tested
  }
}
```

---

## 2. Integration Verification

### ✅ Prefer: Explicit Integration Testing

- Break complex features into base implementation + integration subtasks
- Use S###-I enumeration pattern for integration checkpoints in Steps.md
- Document manual testing procedures for each integration point
- Verify data flows correctly between systems before marking complete
- Test complete workflows end-to-end, not just individual components

### ❌ Avoid: Binary Task Completion

- Marking feature "done" without integration verification
- Assuming systems communicate correctly without testing
- Skipping end-to-end flow testing to save time
- Checkbox completion based solely on code presence

**Integration Testing Levels**:
1. **Component-level**: Feature works with its direct dependencies
2. **System-level**: Complete workflows function end-to-end
3. **Cross-system**: Multiple systems interact correctly

---

## 3. Decision Documentation

### ✅ Prefer: ADR for Deviations

When implementation deviates from Spec.md:
1. Create ADR in `Context/Decisions/` immediately
2. Document: Context (why deviation needed), Decision (what changed), Consequences (trade-offs)
3. Reference ADR number in commit message for traceability
4. Update Spec.md Revision History section

When establishing patterns:
1. Create ADR documenting the pattern
2. Future implementations should reference the ADR
3. If changing an established pattern, supersede the original ADR

### ❌ Avoid: Undocumented Changes

- Implementing differently from Spec.md without documentation
- "Will document later" mentality leading to lost context
- Behavior changes without any record of the decision
- Future sessions "fixing" intentional deviations back to spec

**ADR Workflow**:
```
Deviation discovered during implementation
  ↓
Create ADR-NNNN in Context/Decisions/
  ↓
Reference in commit: "feat: change X (ADR-NNNN)"
  ↓
Update Spec.md Revision History
```

---

## 4. Quality Assurance

### Validation Agents

- `check-task-completion` - Validates completion criteria at milestones
- `check-accessibility` - Ensures accessibility compliance (if applicable)
- `check-modern-code` - Detects deprecated APIs (if applicable)

### Manual Checkpoints

Before marking ANY task complete, verify:

1. **"Does it actually work?"**
   - Manually tested in real usage scenario?
   - Saw the feature function, not just compile?

2. **"Are integrations verified?"**
   - Checked that referenced methods exist?
   - Tested system-to-system communication?

3. **"Are deviations documented?"**
   - Behavior differs from Spec.md → ADR created?
   - Architecture differs from Tech.md → ADR created?
   - Bugs found → `/ctxk:bckl:add-bug` used?

4. **"Would this confuse future sessions?"**
   - Context documented for AI sessions without memory?
   - Assumptions explicit?

---

## 5. Red Flags - Task NOT Complete

If ANY of these are true, the task is NOT complete:

- ⚠️ "// handled elsewhere" comment without verified code at that location
- ⚠️ TODO comments without follow-up tasks in Steps.md or backlog
- ⚠️ Code compiles but feature doesn't work when tested in application
- ⚠️ Integration assumed but not verified with actual testing
- ⚠️ Changed from plan but no ADR created to document deviation
- ⚠️ Stub method with "// will implement" but no explicit task created
- ⚠️ Works in isolation but fails when integrated with other systems

---

## 6. Milestone Validation

At every 🏁 MILESTONE marker in Steps.md:

1. **Run Validation**
   - Execute `check-task-completion` agent
   - Review all changes since last milestone
   - Verify no stub implementations remain

2. **If Violations Found**
   - BLOCK commit until resolved
   - Options:
     - Fix violations now
     - Create ADR documenting why deviation is acceptable
     - Skip with explicit documentation (emergency only)

3. **Documentation Check**
   - All deviations have ADRs?
   - Spec.md Revision History updated?
   - No undocumented behavior changes?

---

## Resources

- **ADR Pattern**: https://adr.github.io/
- **AWS ADR Best Practices**: https://aws.amazon.com/blogs/architecture/master-architecture-decision-records-adrs/
- **Google Cloud ADR Overview**: https://docs.cloud.google.com/architecture/architecture-decision-records

════════════════════════════════════════════════════════════════════════════════
👩‍💻 DEVELOPER CUSTOMIZATIONS - EDITABLE SECTION
════════════════════════════════════════════════════════════════════════════════

This section is preserved during ContextKit migrations and updates.
Add project-specific instructions, examples, and overrides below.

## Project-Specific Completion Criteria
<!-- Add criteria specific to your project type -->
<!-- Example: "Game features must have visible effects" -->
<!-- Example: "API endpoints must have integration tests" -->

## Additional Red Flags
<!-- Document patterns that indicate incomplete work in your domain -->
<!-- Example: "Missing loading states in UI components" -->
<!-- Example: "No error handling for network requests" -->

## Integration Testing Requirements
<!-- Define project-specific integration testing requirements -->
<!-- Example: "All database operations must be tested with real database" -->

## Override Behaviors
<!-- Document any project-specific exceptions to these guidelines -->
