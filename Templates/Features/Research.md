# Technical Research: [Feature from Spec.md]
<!-- Template Version: 1 | ContextKit: 0.0.0 | Updated: 2025-09-14 -->

## Description
Technical research template providing systematic knowledge acquisition for technologies, frameworks, APIs, and integration patterns mentioned in feature specifications.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - TECHNICAL RESEARCH & KNOWLEDGE ACQUISITION
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║
║ ### Phase 1: Knowledge Gap Identification
║
║ 1. **Load Feature Specification**
║    - Use `Read` tool to read current feature directory Spec.md: `Read Context/Features/[FeatureName]/Spec.md`
║    - If missing: ERROR "Feature specification required for research phase"
║    - Extract: functional requirements, mentioned technologies, integrations
║
║ 2. **Load Project Context**
║    - Use `Read` tool to read project Context.md: `Read Context.md`
║    - Extract: current tech stack, existing dependencies, architecture patterns
║    - For workspace projects: Use `Read` tool on workspace Context.md for tech preferences
║
║ 3. **Identify Research Targets**
║    - Scan specification for mentioned technologies (frameworks, libraries, APIs)
║    - Identify external services and integration requirements
║    - Mark unfamiliar patterns, architectural approaches, or constraints
║    - List technologies requiring best practice research
║
║ 4. **Launch Comprehensive Codebase Integration Agent**
║    - Create single comprehensive codebase integration agent task:
║      - Agent: "analyze-codebase-integration" with context: "Complete codebase analysis for [feature] integration"
║      - Agent scope: Discovery, pattern analysis, integration planning, complexity assessment
║      - Agent tasks:
║        - Use Glob/Grep to find existing models, views, services related to [feature domain]
║        - Analyze existing architectural patterns, naming conventions, error handling approaches
║        - Determine integration requirements: files to modify vs. new files to create
║        - Assess implementation complexity, potential conflicts, refactoring needs
║        - Map data flow between [feature] and existing components
║      - Agent returns: comprehensive integration strategy with patterns, requirements, complexity analysis
║    - Single agent execution provides complete codebase integration analysis
║    - Result: Unified codebase integration plan without redundant analysis phases
║
║ ### Phase 2: Active Knowledge Acquisition
║
║ 5. **Launch Technology Research Agents**
║    - Create focused research agent tasks for each mentioned technology:
║      - Agent: "research-errorkit" with context: "ErrorKit error handling patterns for iOS apps"
║      - Agent: "research-cloudkit" with context: "CloudKit sync capabilities and limitations for feature"
║      - Agent: "research-swiftui" with context: "SwiftUI patterns and best practices for [feature area]"
║      - Each agent receives technology context and feature requirements
║      - Agents use WebFetch for official docs, return: versions, capabilities, limitations, integration approaches
║    - Launch technology agents concurrently for parallel research execution
║    - Consolidate agent findings into technology decision matrix with version compatibility
║
║ 6. **Launch API Research Agents**
║    - Create API research agent tasks for each external service:
║      - Agent: "research-api-service" with context: "[Service Name] API documentation, rate limits, pricing analysis"
║      - Agent: "research-auth-methods" with context: "[Service] authentication, data formats, iOS SDK analysis"
║      - Each agent receives service context and integration requirements
║      - Agents use WebFetch for API docs, return: capabilities, constraints, costs, integration complexity
║    - Execute API research agents concurrently for parallel service evaluation
║    - Consolidate findings into service integration assessment with cost and complexity analysis
║
║ 7. **Launch Architecture Pattern Research Agents**
║    - Create pattern research agent tasks for complex architectural needs:
║      - Agent: "research-offline-sync" with context: "Offline-first architecture patterns for iOS apps"
║      - Agent: "research-error-patterns" with context: "Modern Swift error handling integration patterns"
║      - Agent: "research-state-management" with context: "SwiftUI state management patterns for [feature complexity]"
║      - Each agent receives pattern context and feature complexity requirements
║      - Agents use WebSearch for best practices, return: implementation approaches, benefits, drawbacks, case studies
║    - Launch pattern research agents in parallel for concurrent architectural evaluation
║    - Consolidate architectural insights into implementation strategy recommendations
║
║ ### Phase 3: Research Consolidation & Decision Making
║
║ 8. **Generate Research Findings Content**
║    - Use `Edit` tool to replace template header with specific feature information:
║      - Title: "# Technical Research: [Feature Name]"
║      - Created: [Current Date]
║      - Status: Research Complete
║      - Prerequisites: Reference to completed Spec.md
║
║ 9. **Document Technology Research Results**
║    - For each researched technology: Decision, rationale, alternatives, limitations
║    - Include version information and compatibility requirements
║    - Note integration approaches and potential issues
║
║ 10. **Document API & Service Research Results**
║    - For each external service: capabilities, limitations, costs, alternatives
║    - Include authentication requirements and rate limiting information
║    - Document data formats and SDK availability
║
║ 11. **Document Codebase Integration Analysis**
║     - Document existing code patterns and architecture that feature will follow
║     - List existing files that need modification vs. new files to create
║     - Map integration points and data flow with existing components
║     - Note consistency requirements and existing patterns to maintain
║
║ 12. **Document Architectural Pattern Research**
║     - For each pattern researched: approach, benefits, drawbacks, complexity
║     - Include performance implications and maintenance considerations
║     - Note proven implementations and case studies
║
║ ### Phase 4: Knowledge Validation & Completion
║
║ 13. **Validate Research Completeness**
║     - All technologies mentioned in specification researched?
║     - External service constraints and capabilities documented?
║     - Architectural approaches evaluated with trade-offs noted?
║     - Current best practices identified for each area?
║
║ 14. **Generate Research Summary**
║     - Key technical decisions ready for architecture phase
║     - Identified constraints that will influence design
║     - Recommended approaches with rationale
║
║ 15. **COMPLETION**
║     - Use `Edit` tool to remove this entire boxed system instructions section
║     - Leave only the clean research results for architecture planning phase
║     - Final document focused on informed technical knowledge for design decisions
║
║ ## Success Criteria
║ - All technologies mentioned in specification thoroughly researched
║ - External service capabilities and limitations documented
║ - Current best practices identified with version information
║ - Integration patterns evaluated with trade-offs documented
║ - Architectural approaches researched with proven examples
║ - Research findings ready to inform technical architecture decisions
║ - System instructions completely removed from final research document
║
════════════════════════════════════════════════════════════════════════════════

# Technical Research: [AI Generated Feature Name]

**Created**: [AI Generated Current Date]
**Status**: Research Complete
**Prerequisites**: Completed business specification (Spec.md)

## Research Overview

### Research Scope
[AI Generated: Summary of external technologies, internal codebase analysis, and integration patterns researched]

### Key Findings Summary
[AI Generated: High-level summary of external research and internal codebase insights that will influence architecture]

## Codebase Integration Analysis

### Existing Architecture Patterns
[AI Generated: Current architectural approaches, naming conventions, and code organization patterns discovered in codebase]

### Related Existing Components
**Models**: [AI Generated: Existing data models that feature will interact with or extend]
**Views**: [AI Generated: Existing UI components that feature will integrate with or modify]
**Services**: [AI Generated: Existing business logic and API layers that feature will connect to]
**Navigation**: [AI Generated: Current navigation patterns and user flows that feature will extend]

### Integration Requirements
**Files to Modify**: [AI Generated: Existing files that need updates to support the feature]
**New Files to Create**: [AI Generated: New files required for feature implementation]
**API Integration Points**: [AI Generated: Existing methods/APIs that feature will call or extend]
**Data Flow**: [AI Generated: How feature data will flow through existing system components]

### Implementation Considerations
**Consistency Requirements**: [AI Generated: Existing patterns that feature must follow]
**Potential Conflicts**: [AI Generated: Areas where feature might conflict with existing code]
**Refactoring Needs**: [AI Generated: Existing code that may need modification for feature integration]
**Testing Integration**: [AI Generated: How feature tests will integrate with existing test suite]

## Technology Research

### [Technology Name]
**Version Researched**: [AI Generated current version]
**Documentation Source**: [AI Generated official docs URL]
**Last Updated**: [AI Generated date]

**Key Capabilities**:
- [AI Generated: Core features and capabilities]
- [AI Generated: Integration patterns available]
- [AI Generated: Performance characteristics]

**Limitations**:
- [AI Generated: Known constraints or issues]
- [AI Generated: Platform compatibility limits]
- [AI Generated: Performance bottlenecks]

**Best Practices**:
- [AI Generated: Recommended usage patterns]
- [AI Generated: Common integration approaches]
- [AI Generated: Performance optimization techniques]

**Decision Rationale**: [AI Generated: Why this technology is suitable for the feature requirements]

### [Additional Technology Name]
[AI Generated: Repeat above structure for each researched technology]

## API & Service Research

### [Service/API Name]
**Documentation Source**: [AI Generated official API docs URL]
**Last Updated**: [AI Generated date]

**Capabilities**:
- [AI Generated: Available endpoints/features]
- [AI Generated: Data formats supported]
- [AI Generated: Authentication methods]

**Constraints**:
- **Rate Limits**: [AI Generated: requests per minute/hour/day]
- **Pricing**: [AI Generated: cost structure if applicable]
- **Data Limits**: [AI Generated: payload sizes, storage limits]

**Integration Requirements**:
- **SDK Availability**: [AI Generated: official SDKs for iOS/macOS]
- **Authentication**: [AI Generated: API keys, OAuth, etc.]
- **Error Handling**: [AI Generated: error codes and handling patterns]

**Decision Rationale**: [AI Generated: Why this service meets the feature requirements]

### [Additional Service Name]
[AI Generated: Repeat above structure for each researched service]

## Architecture Pattern Research

### [Pattern Name] (e.g., Offline-First Architecture)
**Research Sources**: [AI Generated: authoritative sources consulted]

**Approach**:
- [AI Generated: How this pattern works]
- [AI Generated: Key implementation components]
- [AI Generated: Data synchronization strategy]

**Benefits**:
- [AI Generated: Advantages for this use case]
- [AI Generated: User experience improvements]
- [AI Generated: Reliability benefits]

**Drawbacks**:
- [AI Generated: Implementation complexity]
- [AI Generated: Performance trade-offs]
- [AI Generated: Maintenance overhead]

**Implementation Considerations**:
- [AI Generated: Key technical challenges]
- [AI Generated: Required infrastructure]
- [AI Generated: Testing strategies]

**Decision Rationale**: [AI Generated: Why this pattern fits the feature requirements]

### [Additional Pattern Name]
[AI Generated: Repeat above structure for each researched pattern]

## Research-Informed Recommendations

### Primary Technology Choices
- **[Technology Category]**: [AI Generated recommended choice] - [AI Generated brief rationale]
- **[Technology Category]**: [AI Generated recommended choice] - [AI Generated brief rationale]
- **[Technology Category]**: [AI Generated recommended choice] - [AI Generated brief rationale]

### Architecture Approach
[AI Generated: Recommended overall architectural approach based on research findings]

### Key Constraints Identified
- [AI Generated: Important limitations that will influence design]
- [AI Generated: Performance bottlenecks to design around]
- [AI Generated: Integration complexity factors]

### Implementation Priorities
1. [AI Generated: Most critical technical decisions based on research]
2. [AI Generated: Secondary priorities with flexibility]
3. [AI Generated: Nice-to-have features that could be deferred]

---

**Next Phase**: This research provides the technical knowledge foundation for architectural planning in Tech.md.

---

════════════════════════════════════════════════════════════════════════════════
║ 🤖 VALIDATION & EXECUTION STATUS - AI WORKFLOW INSTRUCTIONS
════════════════════════════════════════════════════════════════════════════════
║
║ ## Research Validation Gates
║
║ ### Knowledge Acquisition Completeness
║ - [ ] All technologies mentioned in specification researched with current versions?
║ - [ ] External APIs and services documented with constraints and capabilities?
║ - [ ] Integration patterns evaluated with trade-offs documented?
║ - [ ] Best practices identified from authoritative sources?
║ - [ ] Limitations and constraints clearly documented for each technology?
║
║ ### Research Quality
║ - [ ] Documentation sources are official and current?
║ - [ ] Version information included for all technologies?
║ - [ ] Rate limits and pricing information accurate (where applicable)?
║ - [ ] Performance characteristics documented with specific metrics?
║ - [ ] Alternative approaches considered and compared?
║
║ ### Decision Readiness
║ - [ ] Clear recommendations provided for technology choices?
║ - [ ] Rationale documented for each recommended approach?
║ - [ ] Key constraints identified that will influence architecture?
║ - [ ] Research findings ready to inform technical planning phase?
║
║ ## Execution Status
║ *Updated by main() during processing*
║
║ ### Phase 1: Knowledge Gap Identification
║ - [ ] Feature specification loaded and analyzed for technologies
║ - [ ] Project context loaded for existing tech stack
║ - [ ] Research targets identified (technologies, APIs, patterns)
║ - [ ] Comprehensive codebase integration analysis completed via agent
║
║ ### Phase 2: Active Knowledge Acquisition
║ - [ ] Technology and framework research conducted via agent delegation
║ - [ ] External API and service research completed via agent delegation
║ - [ ] Architectural pattern research performed via agent delegation
║ - [ ] Current best practices identified and documented from all agents
║
║ ### Phase 3: Research Consolidation & Decision Making
║ - [ ] Research findings content generated and organized
║ - [ ] Technology research results documented with decisions
║ - [ ] API and service research results documented with constraints
║ - [ ] Codebase integration analysis documented with comprehensive patterns
║ - [ ] Architectural pattern research documented with implementation strategies
║
║ ### Phase 4: Knowledge Validation & Completion
║ - [ ] Research completeness validated against specification and codebase
║ - [ ] Research summary generated with key decisions and integrations
║ - [ ] All validation gates passed
║ - [ ] System instructions removed from final document
║
║ **Next Phase**: Research findings provide foundation for technical architecture planning in Tech.md.
║
════════════════════════════════════════════════════════════════════════════════