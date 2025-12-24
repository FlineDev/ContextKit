# Implementation Steps: [Feature from Tech.md]
<!-- Template Version: 13 | ContextKit: 0.2.0 | Updated: 2025-12-24 -->

## Description
Implementation task breakdown template providing systematic S001-S999 task enumeration with parallel execution markers and dependency analysis for iOS/macOS development workflows.

## 🚨 CRITICAL: This File is Your Progress Tracker

**This Steps.md file serves as the authoritative source of truth for implementation progress across all development sessions.**

### Key Principles
- **Token limits are irrelevant** - Progress is tracked here, sessions are resumable
- **Never rush or take shortcuts** - Each step deserves proper attention and time
- **Session boundaries don't matter** - User can resume where this file shows progress
- **Steps.md is the real todo list** - Even if AI uses TodoWrite during a session, THIS file is what persists
- **Quality over speed** - Thoroughness is mandatory, optimization for token limits is forbidden
- **Check off progress here** - Mark tasks as complete in this file as they're finished

### How This Works
1. Each task has a checkbox: `- [ ] **S001** Task description`
2. As tasks complete, they're marked: `- [x] **S001** Task description`
3. AI ignores token limit concerns and works methodically through steps
4. If context usage gets high (>80%), AI suggests user runs `/compact` before continuing
5. If session ends: User starts new session and resumes (this file has all progress)
6. Take the time needed for each step - there's no rush to finish in one session

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - IMPLEMENTATION STEPS GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║
║ ### Phase 1: Prerequisites & Planning Analysis
║
║ 1. **Load Technical Planning**
║    - Use `Read` tool to read current feature directory Tech.md: `Read Context/Features/[FeatureName]/Tech.md`
║    - If missing: ERROR "Technical planning required - run /ctxk:plan:2-research-tech first"
║    - If 🚨 [NEEDS CLARIFICATION] markers exist: ERROR "Resolve technical uncertainties first"
║    - Extract from Research & Analysis section: technology decisions, API constraints, integration patterns, version requirements
║    - Extract from Technical Architecture section: architecture decisions, component structure, dependencies
║    - Cross-reference research findings with architecture for implementation constraints
║    - Document technology limitations and best practices for implementation guidance
║
║ 2. **Load Feature Specification**
║    - Use `Read` tool to read current feature directory Spec.md: `Read Context/Features/[FeatureName]/Spec.md`
║    - Extract: user stories, functional requirements, acceptance criteria
║    - Map requirements to implementation tasks with research-informed constraints
║
║ 2.5 **Load ADR Context**
║    - Use `Glob Context/Decisions *.md` to find existing Architecture Decision Records
║    - If ADRs found:
║      - Reference established patterns when creating implementation tasks
║      - Note architectural constraints from previous decisions
║
║ 3. **Analyze Implementation Complexity and Scope**
║    - Count: new files, modified files, new APIs, tests needed
║    - If scope > 25 tasks: WARN "Consider breaking into smaller features"
║    - **Knowledge Gap Assessment**: Evaluate API documentation quality and newness
║      - Well-documented Apple APIs = Low Risk
║      - Community-documented technologies = Medium Risk
║      - New/niche/poorly documented APIs = High Risk
║    - Identify critical path and parallel opportunities
║
║ ### Phase 2: Task Generation & Organization
║
║ 4. **Apply Task Generation Rules with Research-Informed Constraints**
║    - Apply technology limitations from research (version requirements, rate limits, API constraints)
║    - Include integration patterns discovered in codebase analysis
║    - Consider performance implications documented in architectural pattern research
║    - **AI-Assisted Development Considerations**: Factor in knowledge gaps and documentation quality for realistic time estimates
║    - One task per file creation/modification
║    - One task per API endpoint implementation
║    - One task per data model definition
║    - One task per significant UI component
║    - TDD approach: tests before implementation
║    - **Xcode Project Management**: Manual user actions required for complex Xcode project changes
║      - Target creation/deletion = Manual user action with standardized box format
║      - Scheme modifications = Manual user action when complex
║      - Simple Info.plist updates = Automated task (allowed)
║      - Build setting changes = Automated task when straightforward
║
║ 5. **Generate Tasks with S### Enumeration (S001, S002...)**
║    - Setup tasks: Project structure, dependencies, configuration (S001-S010)
║    - Model tasks: Data layer implementation with TDD approach (S011-S020)
║    - Service tasks: Business logic and API integration (S021-S030)
║    - UI tasks: SwiftUI views, navigation, user interaction (S031-S040)
║    - Integration tasks: **Automated testing only** - builds, unit tests, agents (S041-S050)
║    - Manual validation tasks: **User testing required** - running apps, interactions (S051-S060)
║    - Polish tasks: Performance, compliance, release prep (S061-S070)
║
║ 6. **Apply Parallel Execution Markers [P]**
║    - Different files = [P] parallel safe
║    - Same file = sequential only
║    - Independent components = [P] parallel safe
║    - Shared resources = sequential only
║    - Tests can run [P] with their implementation counterparts
║
║ ### Phase 3: Dependency Analysis & Validation
║
║ 7. **Validate Dependency Chains with Research Constraints**
║    - Apply external service dependencies and rate limiting from research
║    - Include technology integration requirements from research findings
║    - Models before Services before UI
║    - Tests can run parallel with implementation
║    - Configuration before usage
║    - Critical path identified and documented
║    - No circular dependencies
║
║ 8. **Run iOS-Specific Task Validation with Research Integration**
║    - Include Apple-specific best practices identified in research
║    - Apply version compatibility requirements from technology research
║    - Privacy manifest updates included?
║    - Context/Guidelines validation tasks planned?
║    - App Store compliance tasks identified?
║    - Platform-specific testing coverage adequate?
║
║ ### Phase 4: Implementation Plan Generation
║
║ 9. **Generate Implementation Steps Content with Research Integration**
║    - Use `Edit` tool to replace template header with specific feature information:
║      - Title: "# Implementation Steps: [Feature Name]"
║      - Created: [Current Date]
║      - Status: Implementation Plan
║      - Prerequisites: Reference to completed Spec.md and Tech.md
║
║ 10. **Fill Task Breakdown Sections with Research-Informed Constraints**
║     - Include technology version requirements from research in setup tasks
║     - Apply API integration patterns discovered in research to service tasks
║     - Include codebase integration requirements from research analysis
║     - Setup & Configuration phase with exact file paths
║     - Model Layer with TDD approach and parallel markers
║     - Service Layer with dependency tracking
║     - UI Layer with SwiftUI implementation tasks
║     - **Automated Integration phase**: Only tasks AI can execute (builds, tests, agents)
║       - **CRITICAL**: Build tasks MUST explicitly specify "Use Task tool with build-project agent"
║       - **CRITICAL**: Test tasks MUST explicitly specify "Use Task tool with run-test-* agent"
║     - **Manual User Testing phase**: Tasks requiring human app interaction with standardized box format
║     - **Milestone Commits**: ALL milestones MUST specify "Use Task tool with commit-changes agent to commit"
║     - Polish & Release Preparation with compliance tasks and external process guidance
║
║ 11. **Generate Dependency Analysis with External Constraints**
║     - Include external service dependencies and rate limits from research
║     - Apply technology integration timing requirements from research findings
║     - Critical path analysis with longest dependency chain
║     - Parallel execution opportunities documentation
║     - Platform-specific dependencies mapping
║
║ 12. **Create Completion Verification Checklist with Research Validation**
║     - Include technology implementation validation based on research best practices
║     - Add performance verification criteria from architectural pattern research
║     - **AI-Assisted Time Estimation**: Generate realistic review and testing time estimates based on:
║       - Claude Code execution speed (fast implementation)
║       - Human review time requirements (reading, understanding, testing)
║       - Knowledge gap risk factors (API documentation quality impact)
║       - Expected correction cycles based on technology maturity
║     - iOS feature completeness requirements
║     - Quality gate validation criteria
║     - App Store readiness verification
║
║ ### Phase 5: Validation & Completion
║
║ 13. **Validate Task Generation Quality**
║     - All requirements have corresponding implementation tasks?
║     - All architecture components have creation tasks?
║     - Context/Guidelines compliance tasks included for relevant features?
║     - Parallel tasks truly independent (different files)?
║     - Each task specifies exact file path and dependencies?
║     - Task descriptions specific enough for execution without ambiguity?
║     - All research findings integrated into implementation tasks?
║     - Technology constraints from research reflected in task dependencies?
║     - API limitations and best practices incorporated into service tasks?
║
║ 14. **Validate Dependency Management**
║     - Dependency graph shows clear execution order?
║     - No circular dependencies in task chain?
║     - Critical path identified and realistic?
║     - Parallel execution opportunities properly marked with [P]?
║     - Platform-specific dependencies documented?
║     - External service dependencies and rate limits from research included?
║     - Technology integration timing requirements applied?
║
║ 15. **Validate iOS/macOS Implementation Coverage**
║     - SwiftUI implementation tasks cover all UI requirements?
║     - Data layer tasks address all storage needs from tech plan?
║     - Service layer tasks handle all business logic requirements?
║     - Testing tasks provide adequate coverage for all components?
║     - Platform compliance tasks address App Store and guideline requirements?
║     - Apple-specific best practices from research integrated?
║     - Version compatibility requirements applied?
║
║ 16. **Validate Automated vs Manual Task Separation**
║     - Phase 5 tasks are truly automated (builds, tests, agents only)?
║     - Phase 6 tasks requiring app interaction use standardized manual testing format?
║     - No manual testing tasks marked as automated AI execution?
║     - Manual testing tasks include clear success/failure response instructions?
║     - External processes (App Store) clearly marked as manual user actions?
║     - Build tasks explicitly specify "Use Task tool with build-project agent"?
║     - Test tasks explicitly specify "Use Task tool with run-test-* agent"?
║     - Milestone commits specify "Use Task tool with commit-changes agent to commit"?
║
║ 17. **Validate Implementation Completeness**
║     - All user scenarios from specification have implementation tasks?
║     - Error handling tasks address all failure modes?
║     - Performance tasks address all technical plan requirements?
║     - Quality assurance tasks validate all Context/Guidelines standards?
║     - Technology implementation validation based on research best practices?
║     - Performance verification criteria from architectural pattern research included?
║
║ 18. **COMPLETION**
║     - Use `Edit` tool to remove this entire boxed system instructions section from the start of the file
║     - Leave only the clean implementation steps content for team use
║     - Final document focused on executable task breakdown with clear dependencies
║
║ ## Success Criteria
║ - All implementation phases completed with specific S### task enumeration
║ - Parallel execution markers [P] applied correctly for independent tasks
║ - Dependency chains validated with no circular dependencies
║ - Context/Guidelines compliance tasks integrated throughout workflow
║ - Critical path analysis completed with realistic execution order
║ - Platform considerations (iOS/macOS) integrated in task definitions
║ - 🚨 [NEEDS CLARIFICATION] markers used for genuine implementation uncertainties only
║ - System instructions completely removed from final implementation plan document
║
════════════════════════════════════════════════════════════════════════════════

# Implementation Steps: [AI Generated Feature Name]

**Created**: [AI Generated Current Date]
**Status**: Implementation Plan
**Prerequisites**: Completed business specification (Spec.md) and technical planning (Tech.md with research and architecture)

## Implementation Phases *(mandatory)*

### Phase 1: Setup & Configuration
*Foundation tasks that must complete before development*

- [ ] **S001** [AI Generated: Create project structure task]
  - **Path**: [AI Generated: Specific directories/files to create]
  - **Dependencies**: None
  - **Notes**: [AI Generated: Setup requirements from tech plan]

- [ ] **S002** [AI Generated: Dependency configuration task]
  - **Path**: [AI Generated: Package.swift or *.xcodeproj modifications]
  - **Dependencies**: [AI Generated: Previous setup tasks]
  - **Notes**: [AI Generated: Required packages from tech plan]

- [ ] **S003** [P] [AI Generated: Additional setup tasks that can run in parallel]

**🏁 MILESTONE: Foundation Setup**
*Use Task tool with commit-changes agent to commit: "Setup [feature] foundation - project structure and dependencies"*

### Phase 2: Data Layer (TDD Approach)
*Models, data structures, and business logic foundation*

#### Test-First Implementation
- [ ] **S004** [P] [AI Generated: Model test creation tasks]
- [ ] **S005** [P] [AI Generated: Additional model test tasks]
- [ ] **S006** [P] [AI Generated: Data validation test tasks]

#### Model Implementation
- [ ] **S007** [P] [AI Generated: Model implementation tasks]
- [ ] **S008** [P] [AI Generated: Additional model tasks]
- [ ] **S009** [AI Generated: Data persistence configuration if needed]

**🏁 MILESTONE: Data Foundation**
*Use Task tool with commit-changes agent to commit: "Implement [feature] data models and validation"*

### Phase 3: Service Layer
*Business logic, API integration, data management*

#### Service Testing
- [ ] **S010** [P] [AI Generated: Service integration test tasks]
- [ ] **S011** [P] [AI Generated: API integration test tasks]

#### Service Implementation
- [ ] **S012** [AI Generated: Primary service implementation]
  - **Dependencies**: [AI Generated: Model dependencies from Phase 2]
  - **Error Handling**: [AI Generated: ErrorKit pattern requirements]
  - **Integration**: [AI Generated: External service integration notes]

- [ ] **S013** [AI Generated: Additional service tasks if needed]

**🏁 MILESTONE: Business Logic Complete**
*Use Task tool with commit-changes agent to commit: "Implement [feature] services and business logic"*

### Phase 4: User Interface
*SwiftUI views, navigation, user interaction*

#### UI Testing
- [ ] **S014** [P] [AI Generated: UI test tasks for primary views]
- [ ] **S015** [P] [AI Generated: UI test tasks for additional views]

#### UI Implementation
- [ ] **S016** [P] [AI Generated: Primary UI view implementation]
  - **Dependencies**: [AI Generated: Service layer dependencies]
  - **Patterns**: [AI Generated: SwiftUI patterns from guidelines]

- [ ] **S017** [P] [AI Generated: Additional UI view tasks]
- [ ] **S018** [AI Generated: Navigation and flow coordination]

**🏁 MILESTONE: User Interface Complete**
*Use Task tool with commit-changes agent to commit: "Implement [feature] user interface and navigation"*

### Phase 5: Automated Integration & Build Validation
*Automated testing, builds, and code quality checks that AI can execute*

- [ ] **S019** [P] [AI Generated: Unit/integration test execution for feature]
  - **Path**: Run test suite with build validation using run-test-suite or run-specific-test agent
  - **Dependencies**: [Previous implementation tasks]
  - **Notes**: Use Task tool with run-test-* agent to execute automated tests and validate build success

- [ ] **S020** [P] [AI Generated: Code quality agent validation]
  - **Path**: Use ContextKit agents (check-modern-code, check-accessibility, etc.)
  - **Dependencies**: [Implementation tasks]
  - **Notes**: Automated code pattern validation, no manual app interaction required

- [ ] **S021** [P] [AI Generated: Error handling pattern validation]
  - **Path**: ErrorKit pattern compliance checking via agents
  - **Dependencies**: [Service layer tasks]
  - **Notes**: Validate error types, user-friendly messages, typed throws patterns

- [ ] **S022** [AI Generated: Build performance and warnings audit]
  - **Path**: Build system validation using build-project agent
  - **Dependencies**: [All implementation tasks]
  - **Notes**: Use Task tool with build-project agent to validate compilation, check warnings, and ensure dependencies resolve correctly

- [ ] **S023** [P] [AI Generated: ADR compliance validation]
  - **Path**: Verify deviations from Spec.md documented in Context/Decisions/
  - **Dependencies**: [Implementation tasks]
  - **Notes**: Check all significant changes have corresponding ADRs; run check-task-completion agent

**🏁 MILESTONE: Automated Validation Complete**
*Use Task tool with commit-changes agent to commit: "Complete [feature] automated testing and quality validation"*

### Phase 6: Manual User Testing & Validation
*Tasks requiring human interaction with running application*

- [ ] **S023** [AI Generated: Manual happy path testing instructions]
  ```
  ═══════════════════════════════════════════════════
  ║ 🧪 MANUAL USER TESTING REQUIRED
  ═══════════════════════════════════════════════════
  ║
  ║ 1. Build and run the app
  ║ 2. [AI Generated: Specific user interaction steps]
  ║ 3. [AI Generated: Expected behavior to verify]
  ║ 4. [AI Generated: Success criteria checklist]
  ║
  ║ Reply "✅ Passed" or "❌ Issues: [description]"
  ```

- [ ] **S024** [AI Generated: Manual error scenario testing instructions]
  ```
  ═══════════════════════════════════════════════════
  ║ 🧪 MANUAL ERROR TESTING REQUIRED
  ═══════════════════════════════════════════════════
  ║
  ║ 1. [AI Generated: Steps to trigger error conditions]
  ║ 2. [AI Generated: Expected error handling behavior]
  ║ 3. [AI Generated: Recovery mechanisms to verify]
  ║
  ║ Reply "✅ Passed" or "❌ Issues: [description]"
  ```

- [ ] **S025** [AI Generated: Manual accessibility testing instructions]
  ```
  ═══════════════════════════════════════════════════
  ║ 🧪 MANUAL ACCESSIBILITY TESTING REQUIRED
  ═══════════════════════════════════════════════════
  ║
  ║ 1. Enable VoiceOver in System Settings > Accessibility
  ║ 2. [AI Generated: Navigation testing steps]
  ║ 3. Test Dynamic Type with larger text sizes
  ║ 4. [AI Generated: Specific accessibility scenarios]
  ║
  ║ Reply "✅ Passed" or "❌ Issues: [description]"
  ```

- [ ] **S026** [AI Generated: Accessibility Inspector comprehensive audit]
  ```
  ═══════════════════════════════════════════════════
  ║ 🔍 ACCESSIBILITY INSPECTOR AUDIT REQUIRED
  ═══════════════════════════════════════════════════
  ║
  ║ 1. Launch Xcode → Open Developer Tool → Accessibility Inspector
  ║ 2. Build and run your app (⌘+R) in Simulator or on device
  ║ 3. In Inspector, select your app target from dropdown
  ║ 4. Click "Audit" tab → "Run Audit" button
  ║ 5. Review all reported issues (missing labels, contrast, hit regions)
  ║ 6. Navigate through your [AI Generated: feature-specific screens]
  ║
  ║ If issues found:
  ║ • Copy issue descriptions with element locations
  ║ • Start new Claude session with: "Fix accessibility issues from Inspector"
  ║ • Paste the issue details for AI assistance in resolving them
  ║
  ║ Reply "✅ No issues" or "✅ Fixed [X] issues with AI assistance"
  ```

**🏁 MILESTONE: User Testing Complete**
*All manual validation scenarios verified by human testing*

### Phase 7: Release Preparation & Compliance
*Final automated tasks and external process preparation*

- [ ] **S027** [P] [AI Generated: Privacy manifest updates]
  - **Path**: `App/PrivacyInfo.xcprivacy` file updates
  - **Dependencies**: [Feature completion]
  - **Notes**: Document new data usage, API calls, background activities

- [ ] **S028** [P] [AI Generated: String Catalog validation]
  - **Path**: Automated localization completeness check
  - **Dependencies**: [UI implementation tasks]
  - **Notes**: Verify all user-facing strings have localization entries

- [ ] **S029** [AI Generated: App Store metadata preparation instructions]
  ```
  ═══════════════════════════════════════════════════
  ║ 📱 APP STORE PREPARATION REQUIRED
  ═══════════════════════════════════════════════════
  ║
  ║ 1. Update App Store Connect metadata:
  ║    - [AI Generated: Feature description updates]
  ║    - [AI Generated: Version notes content]
  ║ 2. Prepare screenshots if UI changed significantly
  ║ 3. Update minimum OS requirements if needed
  ║
  ║ Reply "✅ Ready for submission" when complete
  ```

**🏁 MILESTONE: Release Ready**
*Use Task tool with commit-changes agent to commit: "Finalize [feature] - ready for App Store submission"*

## AI-Assisted Development Time Estimation *(Claude Code + Human Review)*

> **⚠️ ESTIMATION BASIS**: These estimates assume development with Claude Code (AI) executing implementation tasks with human review and guidance. Times reflect AI execution + human review cycles, not manual coding.

### Phase-by-Phase Review Time
**Setup & Configuration**: [AI Generated human review time]
- *AI executes quickly, human reviews project structure and dependencies*

**Data Layer**: [AI Generated human review time]
- *AI implements models/tests, human validates business logic and data relationships*

**Service Layer**: [AI Generated human review time]
- *AI builds services, human reviews integration patterns and error handling*

**User Interface**: [AI Generated human review time]
- *AI creates UI components, human tests user experience and visual design*

**Integration & Quality**: [AI Generated human review time]
- *AI runs quality checks, human performs acceptance testing and validates workflows*

### Knowledge Gap Risk Factors
**🟢 Low Risk** (Well-documented Apple APIs): Minimal correction cycles expected
**🟡 Medium Risk** (Community-documented technologies): Some refinement iterations likely
**🔴 High Risk** (New/niche APIs with limited documentation): Multiple correction cycles expected

**API Documentation Quality Impact**:
- **Excellent docs** (Apple frameworks): ~10% additional review time
- **Good community docs**: ~25% additional review time
- **Poor/sparse docs**: ~50-100% additional review time
- **Brand new/beta APIs**: ~100%+ additional review time

### Total Estimated Review Time
**Core Development**: [AI Generated base time for human review]
**Risk-Adjusted Time**: [AI Generated time with knowledge gap factors]
**Manual Testing Allocation**: [AI Generated testing time estimate]

> **💡 TIME COMPOSITION**:
> - AI Implementation: ~10-20% (Claude Code executes quickly)
> - Human Review: ~40-50% (reading, understanding, testing)
> - Correction Cycles: ~20-30% (refinements and fixes)
> - Manual Testing: ~20-30% (validation and acceptance)

## Implementation Structure *(AI guidance)*

### Task Numbering Convention
- **Format**: `S###` with sequential numbering (S001, S002, S003...)
- **Parallel Markers**: `[P]` for tasks that can run concurrently
- **Dependencies**: Clear prerequisite task references
- **File Paths**: Specific target files for each implementation task

### Progress Tracking & Session Continuity
- **This file is the progress tracker** - Check off tasks as `[x]` when complete
- **Sessions are resumable** - New sessions read this file to see what's done
- **Token limits don't matter** - Work can span multiple sessions seamlessly
- **Never rush to completion** - Take the time each step needs for quality
- **TodoWrite is temporary** - Only this file persists across sessions
- **Quality is paramount** - Shortcuts and speed optimizations are forbidden

### Parallel Execution Rules
- **Different files** = `[P]` parallel safe
- **Same file modifications** = Sequential only
- **Independent components** = `[P]` parallel safe
- **Shared resources** = Sequential only
- **Tests with implementation** = Can run `[P]` parallel

### Manual User Action Format
For complex Xcode operations (target creation, scheme setup), use standardized format:
```
═══════════════════════════════════════════════════
║ 🎯 MANUAL XCODE ACTION REQUIRED
═══════════════════════════════════════════════════
║
║ [Step-by-step Xcode UI instructions]
║ [Specific menu paths and actions]
║
║ Reply "Done" when completed to continue.
```

### Quality Integration
*Built into implementation phases, not separate agent tasks*

- **Code Standards**: Follow Context/Guidelines patterns throughout
- **Error Handling**: Apply ErrorKit patterns during service implementation
- **UI Guidelines**: Follow SwiftUI patterns during UI implementation
- **Testing Coverage**: Include test tasks for each implementation phase
- **Platform Compliance**: Consider iOS/macOS requirements in each phase

## Dependency Analysis *(AI generated)*

### Critical Path
[AI Generated: Longest dependency chain through phases with AI-assisted time estimates]

### Parallel Opportunities
[AI Generated: Tasks that can execute concurrently with [P] markers - AI can work on multiple independent files simultaneously while human reviews completed work]

### Platform Dependencies
[AI Generated: iOS/macOS specific requirements and dependencies]

## Completion Verification *(mandatory)*

### Implementation Completeness
- [ ] All user scenarios from Spec.md have corresponding implementation tasks?
- [ ] All architectural components from Tech.md have creation/modification tasks?
- [ ] Error handling and edge cases covered in task breakdown?
- [ ] Performance requirements addressed in implementation plan?
- [ ] Platform-specific requirements integrated throughout phases?
- [ ] All deviations from Spec.md documented in Context/Decisions/ ADRs?
- [ ] ADRs reference affected Spec.md sections?

### Quality Standards
- [ ] Each task specifies exact file paths and dependencies?
- [ ] Parallel markers `[P]` applied correctly for independent tasks?
- [ ] Test tasks included for all major implementation components?
- [ ] Code standards and guidelines referenced throughout plan?
- [ ] No implementation details that should be in tech plan?

### Release Readiness
- [ ] Privacy and compliance considerations addressed?
- [ ] Documentation and release preparation tasks included?
- [ ] Feature branch ready for systematic development execution?
- [ ] All milestones defined with appropriate commit guidance?

---

**Next Phase**: After implementation steps are completed, proceed to `/ctxk:impl:start-working` to begin systematic development execution.

---