# Implementation Steps: [Feature from Tech.md]
<!-- Template Version: 1 | ContextKit: 0.0.0 | Updated: 2025-09-14 -->

## Description
Implementation task breakdown template providing systematic S001-S999 task enumeration with parallel execution markers and dependency analysis for iOS/macOS development workflows.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - IMPLEMENTATION STEPS GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║
║ ### Phase 1: Prerequisites & Planning Analysis
║
║ 1. **Load Technical Architecture Plan**
║    - Use `Read` tool to read current feature directory Tech.md: `Read Context/Features/[FeatureName]/Tech.md`
║    - If missing: ERROR "Technical plan required - run /ctxk:plan:2-tech first"
║    - Extract: architecture decisions, component structure, dependencies
║    - If [NEEDS CLARIFICATION] markers exist: ERROR "Resolve technical uncertainties first"
║
║ 2. **Load Feature Specification**
║    - Use `Read` tool to read current feature directory Spec.md: `Read Context/Features/[FeatureName]/Spec.md`
║    - Extract: user stories, functional requirements, acceptance criteria
║    - Map requirements to implementation tasks
║
║ 3. **Analyze Implementation Complexity and Scope**
║    - Count: new files, modified files, new APIs, tests needed
║    - If scope > 25 tasks: WARN "Consider breaking into smaller features"
║    - Identify critical path and parallel opportunities
║
║ ### Phase 2: Task Generation & Organization
║
║ 4. **Apply Task Generation Rules**
║    - One task per file creation/modification
║    - One task per API endpoint implementation
║    - One task per data model definition
║    - One task per significant UI component
║    - TDD approach: tests before implementation
║
║ 5. **Generate Tasks with S### Enumeration (S001, S002...)**
║    - Setup tasks: Project structure, dependencies, configuration (S001-S010)
║    - Model tasks: Data layer implementation with TDD approach (S011-S020)
║    - Service tasks: Business logic and API integration (S021-S030)
║    - UI tasks: SwiftUI views, navigation, user interaction (S031-S040)
║    - Integration tasks: End-to-end flows and validation (S041-S050)
║    - Polish tasks: Performance, compliance, release prep (S051-S060)
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
║ 7. **Validate Dependency Chains**
║    - Models before Services before UI
║    - Tests can run parallel with implementation
║    - Configuration before usage
║    - Critical path identified and documented
║    - No circular dependencies
║
║ 8. **Run iOS-Specific Task Validation**
║    - Privacy manifest updates included?
║    - Context/Guidelines validation tasks planned?
║    - App Store compliance tasks identified?
║    - Platform-specific testing coverage adequate?
║
║ ### Phase 4: Implementation Plan Generation
║
║ 9. **Generate Implementation Steps Content**
║    - Use `Edit` tool to replace template header with specific feature information:
║      - Title: "# Implementation Steps: [Feature Name]"
║      - Created: [Current Date]
║      - Status: Implementation Plan
║      - Prerequisites: Reference to completed Spec.md and Tech.md
║
║ 10. **Fill Task Breakdown Sections**
║     - Setup & Configuration phase with exact file paths
║     - Model Layer with TDD approach and parallel markers
║     - Service Layer with dependency tracking
║     - UI Layer with SwiftUI implementation tasks
║     - Integration & Quality Assurance with validation tasks
║     - Polish & Release Preparation with compliance tasks
║
║ 11. **Generate Dependency Analysis**
║     - Critical path analysis with longest dependency chain
║     - Parallel execution opportunities documentation
║     - Platform-specific dependencies mapping
║
║ 12. **Create Completion Verification Checklist**
║     - iOS feature completeness requirements
║     - Quality gate validation criteria
║     - App Store readiness verification
║
║ ### Phase 5: Validation & Completion
║
║ 13. **Run Implementation Validation Gates**
║     - All requirements have corresponding implementation tasks?
║     - All architecture components have creation tasks?
║     - Context/Guidelines compliance tasks included?
║     - Parallel tasks truly independent (different files)?
║     - Each task specifies exact file path?
║     - Dependency graph shows clear execution order?
║
║ 14. **Update Implementation Plan Status**
║     - Check off all completed implementation planning items
║     - Mark any remaining [NEEDS CLARIFICATION] areas
║     - Validate all mandatory sections completed
║
║ 15. **COMPLETION**
║     - Use `Edit` tool to remove this entire boxed system instructions section
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
║ - [NEEDS CLARIFICATION] markers used for genuine implementation uncertainties only
║ - System instructions completely removed from final implementation plan document
║
════════════════════════════════════════════════════════════════════════════════

# Implementation Steps: [AI Generated Feature Name]

**Created**: [AI Generated Current Date]
**Status**: Implementation Plan
**Prerequisites**: Completed business specification (Spec.md) and technical architecture (Tech.md)

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
*Consider commit: "Setup [feature] foundation - project structure and dependencies"*

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
*Consider commit: "Implement [feature] data models and validation"*

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
*Consider commit: "Implement [feature] services and business logic"*

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
*Consider commit: "Implement [feature] user interface and navigation"*

### Phase 5: Integration & Validation
*End-to-end functionality, error scenarios, edge cases*

- [ ] **S019** [P] [AI Generated: Happy path integration testing]
- [ ] **S020** [P] [AI Generated: Error scenario testing]
- [ ] **S021** [P] [AI Generated: Edge case validation]
- [ ] **S022** [AI Generated: Performance testing and optimization]

**🏁 MILESTONE: Feature Integration**
*Consider commit: "Complete [feature] integration and validation"*

### Phase 6: Quality & Compliance
*Code quality, platform compliance, release preparation*

- [ ] **S023** [P] [AI Generated: Accessibility validation tasks]
- [ ] **S024** [P] [AI Generated: Localization validation tasks]
- [ ] **S025** [P] [AI Generated: Code quality and modernization tasks]
- [ ] **S026** [AI Generated: Privacy and compliance updates if needed]
- [ ] **S027** [AI Generated: Documentation and release preparation]

**🏁 MILESTONE: Release Ready**
*Consider commit: "Finalize [feature] - quality gates and compliance"*

## Implementation Structure *(AI guidance)*

### Task Numbering Convention
- **Format**: `S###` with sequential numbering (S001, S002, S003...)
- **Parallel Markers**: `[P]` for tasks that can run concurrently
- **Dependencies**: Clear prerequisite task references
- **File Paths**: Specific target files for each implementation task

### Parallel Execution Rules
- **Different files** = `[P]` parallel safe
- **Same file modifications** = Sequential only
- **Independent components** = `[P]` parallel safe
- **Shared resources** = Sequential only
- **Tests with implementation** = Can run `[P]` parallel

### Quality Integration
*Built into implementation phases, not separate agent tasks*

- **Code Standards**: Follow Context/Guidelines patterns throughout
- **Error Handling**: Apply ErrorKit patterns during service implementation
- **UI Guidelines**: Follow SwiftUI patterns during UI implementation
- **Testing Coverage**: Include test tasks for each implementation phase
- **Platform Compliance**: Consider iOS/macOS requirements in each phase

## Dependency Analysis *(AI generated)*

### Critical Path
[AI Generated: Longest dependency chain through phases]

### Parallel Opportunities
[AI Generated: Tasks that can execute concurrently with [P] markers]

### Platform Dependencies
[AI Generated: iOS/macOS specific requirements and dependencies]

## Completion Verification *(mandatory)*

### Implementation Completeness
- [ ] All user scenarios from Spec.md have corresponding implementation tasks?
- [ ] All architectural components from Tech.md have creation/modification tasks?
- [ ] Error handling and edge cases covered in task breakdown?
- [ ] Performance requirements addressed in implementation plan?
- [ ] Platform-specific requirements integrated throughout phases?

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

════════════════════════════════════════════════════════════════════════════════
║ 🤖 VALIDATION & EXECUTION STATUS - AI WORKFLOW INSTRUCTIONS
════════════════════════════════════════════════════════════════════════════════
║
║ ## Implementation Validation Gates
║
║ ### Task Generation Quality
║ - [ ] All requirements have corresponding implementation tasks?
║ - [ ] All architecture components have creation tasks?
║ - [ ] Context/Guidelines compliance tasks included for relevant features?
║ - [ ] Parallel tasks truly independent (different files)?
║ - [ ] Each task specifies exact file path and dependencies?
║ - [ ] Task descriptions specific enough for execution without ambiguity?
║
║ ### Dependency Management
║ - [ ] Dependency graph shows clear execution order?
║ - [ ] No circular dependencies in task chain?
║ - [ ] Critical path identified and realistic?
║ - [ ] Parallel execution opportunities properly marked with [P]?
║ - [ ] Platform-specific dependencies documented?
║
║ ### iOS/macOS Implementation Coverage
║ - [ ] SwiftUI implementation tasks cover all UI requirements?
║ - [ ] Data layer tasks address all storage needs from tech plan?
║ - [ ] Service layer tasks handle all business logic requirements?
║ - [ ] Testing tasks provide adequate coverage for all components?
║ - [ ] Platform compliance tasks address App Store and guideline requirements?
║
║ ### Implementation Completeness
║ - [ ] All user scenarios from specification have implementation tasks?
║ - [ ] Error handling tasks address all failure modes?
║ - [ ] Performance tasks address all technical plan requirements?
║ - [ ] Quality assurance tasks validate all Context/Guidelines standards?
║
║ ## Execution Status
║ *Updated by main() during processing*
║
║ ### Phase 1: Prerequisites & Planning Analysis
║ - [ ] Technical architecture plan loaded and analyzed
║ - [ ] Feature specification loaded for requirement mapping
║ - [ ] Implementation complexity and scope assessed
║ - [ ] Critical path and parallel opportunities identified
║
║ ### Phase 2: Task Generation & Organization
║ - [ ] Task generation rules applied systematically
║ - [ ] S### enumeration generated with proper sequencing
║ - [ ] Parallel execution markers [P] applied correctly
║ - [ ] Task dependencies mapped and validated
║
║ ### Phase 3: Dependency Analysis & Validation
║ - [ ] Dependency chains validated with no circular references
║ - [ ] iOS-specific task validation completed
║ - [ ] Platform-specific dependencies documented
║ - [ ] Critical path analysis completed
║
║ ### Phase 4: Implementation Plan Generation
║ - [ ] Implementation steps content generated
║ - [ ] Task breakdown sections completed with exact file paths
║ - [ ] Dependency analysis documented with parallel opportunities
║ - [ ] Completion verification checklists created
║
║ ### Phase 5: Validation & Completion
║ - [ ] Implementation validation gates executed
║ - [ ] Implementation plan status updated
║ - [ ] All mandatory sections completed
║ - [ ] System instructions removed from final document
║
║ **Next Phase**: After implementation steps are completed, proceed to `/ctxk:impl:start-working` to begin systematic development execution.
║
════════════════════════════════════════════════════════════════════════════════