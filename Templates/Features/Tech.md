# Technical Planning: [Feature from Spec.md]
<!-- Template Version: 8 | ContextKit: 0.2.0 | Updated: 2025-12-24 -->

## Description
Technical planning template combining research and architecture phases into single workflow. Executes systematic knowledge acquisition followed by technical architecture design in one continuous flow.

════════════════════════════════════════════════════════════════════════════════
║ 🤖 EXECUTION FLOW - RESEARCH & TECHNICAL PLANNING
════════════════════════════════════════════════════════════════════════════════
║
║ ## Execution Flow (main)
║
║ ### Phase 1: Research & Knowledge Acquisition
║
║ 1. **Load Feature Specification**
║    - Use `Read` tool to read current feature directory Spec.md: `Read Context/Features/[FeatureName]/Spec.md`
║    - If missing: ERROR "Feature specification required for technical planning"
║    - Extract: functional requirements, mentioned technologies, integrations
║
║ 2. **Load Project Context**
║    - Use `Read` tool to read project Context.md: `Read Context.md`
║    - Extract: current tech stack, existing dependencies, architecture patterns
║    - For workspace projects: Use `Read` tool on workspace Context.md for tech preferences
║
║ 2.5 **Check Alignment with Existing ADRs**
║     - Use `Glob Context/Decisions *.md` to find existing decisions
║     - If ADRs found:
║       - Verify proposed architecture aligns with existing ADRs
║       - If conflict found: Document in Architecture section as deviation candidate
║       - Reference relevant ADRs in technical decisions
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
║ 5. **Launch Technology Research Agents**
║    - Create focused research agent tasks for each mentioned technology:
║      - Agent: "research-errorkit" with context: "ErrorKit error handling patterns for iOS apps"
║      - Agent: "research-cloudkit" with context: "CloudKit sync capabilities and limitations for feature"
║      - Agent: "research-swiftui" with context: "SwiftUI patterns and best practices for [feature area]"
║      - Each agent receives technology context and feature requirements
║      - **CRITICAL**: Instruct agents to RETURN findings as text response, NOT create markdown files
║      - **Apple Platform Priority Domains**: For iOS/macOS technologies, agents MUST prioritize these domains:
║        - **developer.apple.com** - Official Apple documentation, HIG, sample code
║        - **wwdcnotes.com** - Community WWDC session summaries and best practices
║        - **Active iOS/Swift Community**: swiftbysundell.com, avanderlee.com, hackingwithswift.com, natasharobot.com, swiftwithmajid.com, fatbobman.com, swiftwithvincent.com, donnywals.com, kodeco.com, elkraneo.com
║        - **Indie Developer Insights**: fline.dev and other established Swift developer blogs
║        - **Domain-Limited Searches**: Use `site:developer.apple.com` or `site:wwdcnotes.com` when researching specific topics
║      - **Apple Technology Search Strategy**: For iOS/macOS/Swift technologies, agents use BOTH WebSearch AND iosfeeds.com/archive search for community articles
║      - **iosfeeds.com Usage**: ONLY for Apple platform technologies - Search iosfeeds.com/archive?query=[AppleTechnologyName] to find recent iOS/Swift blog posts
║      - **Non-Apple Technologies**: Use only WebSearch and official documentation for Android, Web, Backend, or other non-Apple technologies
║      - Agents use WebFetch for official docs, return: versions, capabilities, limitations, integration approaches WITH SPECIFIC URLs of key sources that informed findings
║    - Launch technology agents concurrently for parallel research execution
║    - Consolidate agent findings into technology decision matrix with version compatibility and source documentation
║
║ 6. **Launch API Research Agents**
║    - Create API research agent tasks for each external service:
║      - Agent: "research-api-service" with context: "[Service Name] API documentation, rate limits, pricing analysis"
║      - Agent: "research-auth-methods" with context: "[Service] authentication, data formats, iOS SDK analysis"
║      - Each agent receives service context and integration requirements
║      - **CRITICAL**: Instruct agents to RETURN findings as text response, NOT create markdown files
║      - Agents use WebFetch for API docs, return: capabilities, constraints, costs, integration complexity WITH SPECIFIC URLs of key documentation that informed findings
║      - **CRITICAL**: All agents must document SPECIFIC ARTICLES/DOCS that informed findings with exact URLs, version numbers, and last-updated dates
║      - **Key Source Focus**: Document only the most relevant sources that directly informed the documented findings
║    - Execute API research agents concurrently for parallel service evaluation
║    - Consolidate findings into service integration assessment with cost and complexity analysis and complete source documentation
║
║ 7. **Launch Architecture Pattern Research Agents**
║    - Create pattern research agent tasks for complex architectural needs:
║      - Agent: "research-offline-sync" with context: "Offline-first architecture patterns for iOS apps"
║      - Agent: "research-error-patterns" with context: "Modern Swift error handling integration patterns"
║      - Agent: "research-state-management" with context: "SwiftUI state management patterns for [feature complexity]"
║      - Each agent receives pattern context and feature complexity requirements
║      - **CRITICAL**: Instruct agents to RETURN findings as text response, NOT create markdown files
║      - **Source Documentation Requirement**: Agents use WebSearch for best practices and MUST return: implementation approaches, benefits, drawbacks, case studies WITH SPECIFIC URLs of articles that informed findings
║      - **Apple Pattern Priority**: For iOS/macOS patterns, prioritize official Apple guidance and use iosfeeds.com for community articles
║      - **Non-Apple Patterns**: Use WebSearch and official documentation for non-Apple architectural patterns
║      - **Key Source Documentation**: Document SPECIFIC ARTICLES that informed architectural decisions with exact URLs
║      - **iosfeeds.com Article Discovery**: Use iosfeeds.com/archive?query=[PatternName] to find recent iOS community articles on architectural patterns
║      - **Comprehensive Coverage**: Combine WebSearch results with iosfeeds.com findings for complete community perspective
║    - Launch pattern research agents in parallel for concurrent architectural evaluation
║    - Consolidate architectural insights into implementation strategy recommendations with comprehensive source documentation
║
║ 8. **Document Research Findings in Research & Analysis Section**
║    - Use `Edit` tool to update template header with specific feature information:
║      - Title: "# Technical Planning: [Feature Name]"
║      - Created: [Current Date]
║      - Status: Planning Complete
║      - Prerequisites: Reference to completed Spec.md
║    - **Document Technology Research Results**:
║      - For each researched technology: Decision, rationale, alternatives, limitations
║      - Include version information and compatibility requirements
║      - Note integration approaches and potential issues
║      - **MANDATORY**: Document SPECIFIC ARTICLES/DOCS that informed findings with exact URLs, dates, and version numbers
║    - **Document API & Service Research Results**:
║      - For each external service: capabilities, limitations, costs, alternatives
║      - Include authentication requirements and rate limiting information
║      - Document data formats and SDK availability
║      - **MANDATORY**: Include SPECIFIC DOCUMENTATION URLs that informed findings, with version numbers and last-updated dates
║    - **Document Codebase Integration Analysis**:
║      - Document existing code patterns and architecture that feature will follow
║      - List existing files that need modification vs. new files to create
║      - Map integration points and data flow with existing components
║      - Note consistency requirements and existing patterns to maintain
║    - **Document Architectural Pattern Research**:
║      - For each pattern researched: approach, benefits, drawbacks, complexity
║      - Include performance implications and maintenance considerations
║      - Note proven implementations and case studies
║      - **MANDATORY**: Document SPECIFIC ARTICLES, documentation pages, WWDC sessions, and case studies that informed findings with exact URLs and dates
║
║ ### Phase 2: Technical Architecture Design
║
║ 9. **Load Development Guidelines**
║    - Use `Glob` tool to discover available guidelines: `Glob Context/Guidelines *.md`
║    - For each found guideline file:
║      - Use `Read` tool: `Read Context/Guidelines/[GuidelineName].md`
║      - Extract architectural patterns, framework preferences, compliance requirements
║    - Document all loaded guidelines for comprehensive architectural compliance validation
║
║ 10. **Apply Context/Guidelines Compliance Gates**
║     - Package-first principle: Can this be architected as Swift package?
║     - ErrorKit integration: How will errors be handled with typed throws?
║     - Code quality: Does architecture meet Context/Guidelines/Swift.md standards?
║     - Platform compliance: Does design follow Context/Guidelines/SwiftUI.md patterns?
║     - If any gate fails: DOCUMENT justification or ERROR "Simplify approach"
║
║ 11. **Design iOS/macOS Architecture with Research-Informed Decisions**
║     - Reference research findings from Phase 1 (documented above)
║     - SwiftUI structure: Views, ViewModels, navigation patterns
║     - Data layer: SwiftData, CoreData, CloudKit, or package-based storage
║     - Service layer: API integration, business logic separation
║     - For each decision: DOCUMENT rationale and alternatives considered
║     - **Reference research section** instead of duplicating details (e.g., "Using technologies researched above...")
║
║ 12. **Generate Implementation Complexity Assessment**
║     - Assess technical complexity and implementation challenges based on research findings
║     - Identify potential risks and mitigation strategies
║     - Mark uncertain areas with 🚨 [NEEDS CLARIFICATION: specific technical question]
║
║ 13. **Fill Technical Architecture Section**
║     - **System Overview**: High-level architecture description and component relationships
║     - **iOS/macOS Implementation Details**: SwiftUI structure, data layer, service layer (referencing research)
║     - **Platform-Specific Considerations**: iOS/macOS requirements, App Store compliance
║     - **Implementation Complexity Assessment**: Technical complexity, risks, dependencies
║     - **Keep architecture section concise** by referencing detailed research section above
║
║ ### Phase 3: Validation
║
║ 14. **Validate Research Completeness**
║     - All technologies mentioned in specification thoroughly researched?
║     - External service capabilities and limitations documented?
║     - Current best practices identified with version information?
║     - Codebase integration analysis completed?
║     - Source URLs documented for all research findings?
║
║ 15. **Validate Architecture Quality**
║     - Technical architecture designed with research-informed decisions?
║     - Context/Guidelines compliance validated throughout architecture?
║     - Architecture section appropriately references research (no unnecessary duplication)?
║     - Technical complexity realistically assessed?
║     - All user scenarios from specification have technical solutions?
║     - Dependencies reasonable and well-justified?
║
║ 16. **Validate Completeness**
║     - Both Research & Analysis section and Technical Architecture section fully populated?
║     - No remaining 🚨 [NEEDS CLARIFICATION] markers (or all resolved)?
║     - All mandatory sections completed?
║
║ ### Phase 4: Completion
║
║ 17. **COMPLETION**
║     - Use `Edit` tool to remove this entire boxed system instructions section from the start of the file
║     - Leave only the clean technical planning content for team use
║     - Final document contains both research findings AND architecture decisions in single file
║
║ ## Success Criteria
║ - All technologies mentioned in specification thoroughly researched
║ - External service capabilities and limitations documented
║ - Current best practices identified with version information
║ - Codebase integration analysis completed
║ - Technical architecture designed with research-informed decisions
║ - Context/Guidelines compliance validated throughout architecture
║ - Technical complexity realistically assessed
║ - Architecture section references research to avoid duplication
║ - System instructions completely removed from final document
║
════════════════════════════════════════════════════════════════════════════════

# Technical Planning: [AI Generated Feature Name]

**Created**: [AI Generated Current Date]
**Status**: Planning Complete
**Prerequisites**: Completed business specification (Spec.md)

---

## Research & Analysis

### Research Scope
[AI Generated: Summary of external technologies, internal codebase analysis, and integration patterns researched]

### Key Findings Summary
[AI Generated: High-level summary of research that will inform architecture decisions]

### Codebase Integration Analysis

**Existing Architecture Patterns**:
[AI Generated: Current architectural approaches, naming conventions, and code organization patterns discovered]

**Related Existing Components**:
- **Models**: [AI Generated: Existing data models that feature will interact with or extend]
- **Views**: [AI Generated: Existing UI components that feature will integrate with or modify]
- **Services**: [AI Generated: Existing business logic and API layers that feature will connect to]
- **Navigation**: [AI Generated: Current navigation patterns and user flows that feature will extend]

**Integration Requirements**:
- **Files to Modify**: [AI Generated: Existing files that need updates]
- **New Files to Create**: [AI Generated: New files required]
- **API Integration Points**: [AI Generated: Existing methods/APIs that feature will call or extend]
- **Data Flow**: [AI Generated: How feature data will flow through existing system components]

**Implementation Considerations**:
- **Consistency Requirements**: [AI Generated: Existing patterns that feature must follow]
- **Potential Conflicts**: [AI Generated: Areas where feature might conflict with existing code]
- **Refactoring Needs**: [AI Generated: Existing code that may need modification]

### Technology Research

#### [Technology Name]
**Version**: [AI Generated current version]
**Documentation**: [AI Generated primary documentation URLs]
**Research Date**: [AI Generated date]
**Community Sources**: [AI Generated: Trusted domains consulted]

**Key Capabilities**:
- [AI Generated: Core features and capabilities]
- [AI Generated: Integration patterns available]
- [AI Generated: Performance characteristics]

**Limitations**:
- [AI Generated: Known constraints or issues]
- [AI Generated: Platform compatibility limits]

**Best Practices**:
- [AI Generated: Recommended usage patterns]
- [AI Generated: Common integration approaches]

**Decision Rationale**: [AI Generated: Why this technology is suitable]

#### [Additional Technologies]
[AI Generated: Repeat above structure for each researched technology]

### API & Service Research

#### [Service/API Name]
**Documentation**: [AI Generated primary documentation URLs]
**API Version**: [AI Generated current version]
**Research Date**: [AI Generated date]

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

**Decision Rationale**: [AI Generated: Why this service meets requirements]

#### [Additional Services]
[AI Generated: Repeat above structure for each researched service]

### Architecture Pattern Research

#### [Pattern Name] (e.g., Offline-First Architecture)
**Research Sources**: [AI Generated: authoritative domains consulted with URLs]
**Research Date**: [AI Generated date]

**Approach**:
- [AI Generated: How this pattern works]
- [AI Generated: Key implementation components]

**Benefits**:
- [AI Generated: Advantages for this use case]
- [AI Generated: User experience improvements]

**Drawbacks**:
- [AI Generated: Implementation complexity]
- [AI Generated: Performance trade-offs]

**Implementation Considerations**:
- [AI Generated: Key technical challenges]
- [AI Generated: Required infrastructure]

**Decision Rationale**: [AI Generated: Why this pattern fits requirements]

#### [Additional Patterns]
[AI Generated: Repeat above structure for each researched pattern]

### Research-Informed Recommendations

**Primary Technology Choices**:
- [AI Generated: Recommended technology with rationale]
- [AI Generated: Additional technology recommendations]

**Architecture Approach**: [AI Generated: Overall architectural approach based on research]

**Key Constraints Identified**:
- [AI Generated: Important limitations that will influence design]
- [AI Generated: Performance bottlenecks to design around]

---

## Technical Architecture

> **Note**: This section references the detailed research findings above to avoid duplication.

### System Overview

**High-Level Architecture**: [AI Generated: Brief description of component relationships, referencing researched technologies]

**Core Components**:
- **[Component Name]**: [AI Generated: Responsibility using technologies researched above]
- **[Component Name]**: [AI Generated: Responsibility and purpose]

**Data Flow**: [AI Generated: Description of how data moves through system, referencing patterns researched above]

### iOS/macOS Implementation Details

#### SwiftUI Structure

**View Hierarchy**:
```
[Feature Name]View (main entry point)
├── [Child View Name] ([AI Generated purpose])
├── [Child View Name] ([AI Generated purpose])
└── [Child View Name] ([AI Generated purpose])
```

**State Management**:
- **ViewModels**: [AI Generated: Strategy using patterns researched above]
- **Data Binding**: [AI Generated: Binding approach]
- **Navigation**: [AI Generated: Navigation pattern]

**Architectural Decision Rationale**:
- **Why this structure**: [AI Generated: Reasoning based on research findings]
- **Alternatives considered**: [AI Generated: Options from research phase]
- **Trade-offs**: [AI Generated: Benefits vs costs based on pattern research]

#### Data Layer Design

**Storage Strategy**: [AI Generated: Choice from researched technologies] (SwiftData | CoreData | CloudKit | Package-based | File-based)

**Model Architecture**:
```swift
// Primary entities (conceptual - detailed implementation in Steps phase)
struct [Primary Model] {
   // [AI Generated: Key properties identified from specification]
}

struct [Secondary Model] {
   // [AI Generated: Supporting data structures]
}
```

**Data Access Pattern**: [AI Generated: Strategy based on researched best practices]
**Synchronization Strategy**: [AI Generated: Approach if applicable, referencing pattern research]

**Decision Rationale**:
- **Why this storage approach**: [AI Generated: Based on technology research]
- **Performance characteristics**: [AI Generated: From research findings]
- **Scalability considerations**: [AI Generated: Based on researched patterns]

#### Service Layer Architecture

**Service Organization**:
- **[Service Name]**: [AI Generated: Responsibility using researched APIs]
- **[Service Name]**: [AI Generated: Responsibility]

**External Integration Strategy**:
- **APIs**: [AI Generated: Integration approach for researched services]
- **Authentication**: [AI Generated: Auth strategy based on API research]
- **Error Handling**: [AI Generated: Strategy using Context/Guidelines ErrorKit patterns]

**Dependency Management**:
- **Package Dependencies**: [AI Generated: Required packages from research]
- **Version Requirements**: [AI Generated: Version constraints from research]
- **Integration Points**: [AI Generated: Integration strategy]

#### Platform-Specific Considerations

**iOS Implementation**:
- **Minimum iOS Version**: [AI Generated: Version justified by researched technology requirements]
- **Device Support**: [AI Generated: iPhone, iPad, Mac Catalyst]
- **Performance Targets**:
  - App launch impact: [AI Generated: Assessment]
  - Memory usage: [AI Generated: Analysis]
  - UI responsiveness: 60fps maintained during [AI Generated: Critical operations]

**macOS Implementation** (if applicable):
- **Minimum macOS Version**: [AI Generated: Version]
- **Mac-Specific Features**: [AI Generated: Mac features]
- **Menu Integration**: [AI Generated: Menu strategy]

**App Store Compliance**:
- **Privacy Manifest Updates**: [AI Generated: Privacy impact]
- **New Permissions Required**: [AI Generated: Permissions needed]
- **Review Guidelines Considerations**: [AI Generated: Review considerations]

### Implementation Complexity Assessment

**Complexity Level**: [AI Generated] (Simple | Moderate | Complex | Very Complex)

**Implementation Challenges**:
- **Setup and Infrastructure**: [AI Generated: Complexity factors based on research]
- **Core Implementation**: [AI Generated: Technical challenges]
- **Integration Points**: [AI Generated: Integration complexity based on codebase analysis]
- **Testing Requirements**: [AI Generated: Testing complexity]

**Risk Assessment**:
- **High Risk Areas**: [AI Generated: Risks identified from research]
- **Mitigation Strategies**: [AI Generated: Risk mitigation approaches]
- **Unknowns**: [AI Generated: Remaining uncertainties]

**Dependency Analysis**:
- **External Dependencies**: [AI Generated: Packages, frameworks, services from research]
- **Internal Dependencies**: [AI Generated: Existing code changes from codebase analysis]
- **Breaking Changes**: [AI Generated: Breaking changes if any]

**Testing Strategy**:
- **Unit Tests**: [AI Generated: Unit test approach]
- **Integration Tests**: [AI Generated: Integration test approach]
- **UI Tests**: [AI Generated: UI test approach]

### Technical Clarifications

**Areas Requiring Resolution**:
[AI Generated: Mark any uncertain technical aspects requiring resolution before implementation]

- 🚨 [NEEDS CLARIFICATION: [AI Generated specific technical question]]

---

**Next Phase**: After this technical planning is approved, proceed to `/ctxk:plan:3-steps` for implementation task breakdown.
