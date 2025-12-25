# Feature Specification Template
<!-- Template Version: 7 | ContextKit: 0.2.0 | Updated: 2025-12-24 -->

## Description
Feature specification template providing systematic business requirements generation with progress tracking and quality validation.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - FEATURE SPECIFICATION GENERATION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║
║ ### Phase 1: Context Analysis & Guidelines Loading
║
║ 1. **Load Project Context**
║    - Use `Read` tool to read project Context.md: `Read Context.md`
║    - Extract project type, tech stack, development patterns, workspace reference
║    - Document project context for specification customization
║
║ 2. **Load All Available Development Guidelines**
║    - Use `Glob` tool to discover available guidelines: `Glob Context/Guidelines *.md`
║    - For each found guideline file:
║      - Use `Read` tool: `Read Context/Guidelines/[GuidelineName].md`
║      - Extract framework preferences, architectural patterns, API choices
║    - For workspace projects: Use `Read` tool on workspace Context.md for additional standards
║    - Document all loaded guidelines for comprehensive development pattern application
║
║ 2.5 **Load Existing Architectural Decisions**
║     - Use `Glob Context/Decisions *.md` to find existing ADRs
║     - If ADRs found:
║       - Review decisions that might impact this feature
║       - Note if feature aligns with or challenges existing decisions
║       - Reference relevant ADRs in specification if applicable
║
║ 3. **Extract User Requirements from Original Input**
║    - Parse original feature description provided by user
║    - Identify key concepts: primary functionality, user actors, data involved, platform targets
║    - Generate initial understanding of user needs and business value
║
║ ### Phase 2: Specification Content Generation
║
║ 4. **Generate Feature Information**
║    - Use `Edit` tool to replace template header with specific feature information:
║      - Title: "# Feature Specification: [Feature Name]"
║      - Feature Branch: `feature/[prefix]-[kebab-case-name]` (from parent command)
║      - Created: [Current Date]
║      - Status: Draft
║      - Input: [Original user description - preserve exactly verbatim, do NOT summarize]
║        Format as: **Input**:\n"""\n[user description]\n"""
║        Use triple quotes (""") not backticks - user input is quoted text, not code
║
║ 5. **Create Primary User Story**
║    - Generate "As a [User Type], I want to [User Goal] so that [User Benefit]"
║    - Include platform-specific context (iOS/macOS considerations)
║    - Add multi-platform context sections
║
║ 6. **Generate Acceptance Scenarios**
║    - Create comprehensive Given/When/Then scenarios
║    - Include Happy Path, Error Path, Edge Cases
║    - Add device-specific scenarios (iPhone, iPad, Mac)
║    - Consider network conditions and offline scenarios
║
║ 7. **Define Functional Requirements**
║    - Generate specific, testable requirements (FR-001, FR-002, etc.)
║    - Each requirement must be:
║      - Testable with clear success/failure criteria
║      - Platform-appropriate for iOS/macOS conventions
║      - User-focused and business-value driven
║
║ ### Phase 3: Business Validation & Scope Definition
║
║ 8. **Focus on Business Value**
║    - Keep specification focused on user needs and business requirements
║    - Avoid technical implementation details (frameworks, APIs, code structure)
║    - Document what users need, not how to build it
║
║ 9. **Feature Justification & Scope Definition**
║    - Apply Value Validation checks: user problem, success metrics, cost/benefit (internal validation)
║    - Generate clear scope boundaries for final specification:
║      - IN SCOPE: Specific features with clear user value
║      - OUT OF SCOPE: Exclude unnecessary features
║    - Note future considerations internally (do not include in final spec)
║    - Apply anti-speculation enforcement (internal validation only)
║
║ 10. **Mark Clarification Needs**
║     - For any ambiguous or underspecified requirements, mark with:
║       🚨 [NEEDS CLARIFICATION: specific question]
║     - Common areas: authentication methods, data persistence, target platforms,
║       performance targets, user flows, business requirements
║
║ ### Phase 4: Validation & Completion
║
║ 11. **Validate Value & Business Focus**
║     - Feature solves specific user problem (not "might be useful")?
║     - Success metrics defined and measurable?
║     - Implementation cost estimated and approved?
║     - Maintenance burden considered and acceptable?
║     - No speculative or "future-proofing" features included?
║     - Each feature tied to current user needs, not hypothetical scenarios?
║     - Feature set focused on core value proposition?
║
║ 12. **Validate Requirements Quality**
║     - All user flows have Happy Path + Error Path scenarios?
║     - Edge cases documented with expected behaviors?
║     - Success criteria are measurable with specific metrics?
║     - Requirements are testable and unambiguous?
║     - No 🚨 [NEEDS CLARIFICATION] markers remain unresolved?
║     - Clear user problems identified and documented?
║
║ 13. **Validate Content Quality**
║     - No implementation details (languages, frameworks, APIs)?
║     - Focused on user value and business needs?
║     - Written for non-technical stakeholders?
║     - All mandatory sections completed?
║     - Platform-specific considerations integrated throughout?
║     - Requirements focused on what users need, not how to build it?
║     - Clear boundaries between business requirements and implementation details?
║
║ 14. **Validate Scope & Completeness**
║     - Testable requirements, clear scope, identified dependencies?
║     - Feature scope properly bounded (IN SCOPE/OUT OF SCOPE)?
║     - Complexity intentionally constrained to essential functionality?
║     - Anti-speculation enforcement applied?
║     - Platform differences considered if relevant to user experience?
║
║ 15. **COMPLETION**
║     - Use `Edit` tool to remove this entire boxed system instructions section from the start of the file
║     - Leave only the clean feature specification content for team use
║     - Final document should end after the Scope Boundaries section
║     - Final document focused on business requirements, not generation process
║
║ ## Success Criteria
║ - All specification sections completed with specific, project-appropriate content
║ - Development guidelines from loaded standards properly applied throughout
║ - Requirements are specific, testable, and unambiguous with clear success criteria
║ - Platform considerations (iOS/macOS) integrated throughout specification
║ - User value clearly articulated without technical implementation details
║ - All validation gates passed and checkboxes marked appropriately
║ - 🚨 [NEEDS CLARIFICATION] markers used for genuine ambiguities only
║ - System instructions completely removed from final specification
║
════════════════════════════════════════════════════════════════════════════════

# Feature Specification: [AI Generated Feature Name]

**Feature Branch**: `feature/[prefix]-[ai-generated-branch-name]`
**Created**: [AI Generated Current Date]
**Status**: Draft
**Input**:
"""
[Original User Description - Preserve Exactly Verbatim - Can be multiple paragraphs]
"""

## User Scenarios & Testing *(mandatory)*

### Primary User Story
[AI Generated: As a [User Type], I want to [User Goal] so that [User Benefit]]

**Platform Context**:
- **Multi-platform**: [AI Generated platform-specific experience differences]
- **User Experience**: [AI Generated user experience considerations]
- **Data Handling**: [AI Generated data and user information considerations]

### Acceptance Scenarios
[AI Generated comprehensive Given/When/Then scenarios based on user input and business requirements]

1. **Given** [AI Generated Scenario Context], **When** [AI Generated User Action], **Then** [AI Generated Expected Outcome]
   - **Happy Path**: [AI Generated normal successful usage scenario]
   - **Error Path**: [AI Generated error handling scenario]
   - **Edge Cases**: [AI Generated edge case scenarios]

2. **Given** [AI Generated Additional Context], **When** [AI Generated Different Action], **Then** [AI Generated Different Outcome]
   - [AI Generated device-specific scenarios from loaded guidelines]

### Edge Cases
[AI Generated edge cases based on user requirements and business logic]
- **Platform variations**: [AI Generated device-specific behaviors if applicable]
- **Multi-device usage**: [AI Generated sync conflicts if applicable]
- **App lifecycle**: [AI Generated background processing, interruption scenarios]
- **Network conditions**: [AI Generated offline/online state changes]
- **User scenarios**: [AI Generated different user types, permissions, data states]

## Requirements *(mandatory)*

### Functional Requirements
[AI Generated specific requirements based on user input and loaded development guidelines]

- **FR-001**: System MUST [AI Generated Specific Requirement 1 based on user input]
- **FR-002**: System MUST [AI Generated Specific Requirement 2 based on user input]
- **FR-003**: System MUST [AI Generated Specific Requirement 3 based on user input]

*[AI ensures each requirement is:]*
- *Testable with clear success/failure criteria*
- *Focused on user value and business needs*
- *Free of technical implementation details*

## Scope Boundaries *(mandatory)*

- **IN SCOPE**: [AI Generated specific features with clear user value]
- **OUT OF SCOPE**: [AI Generated explicitly excluded tempting but unnecessary features]

---