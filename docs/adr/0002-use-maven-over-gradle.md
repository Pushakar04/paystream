# 2. Use Maven over Gradle

Date: $(date +%Y-%m-%d)

## Status
Accepted

## Context
Both Maven and Gradle are valid choices for a multi-module Spring Boot project.

## Decision
Use Maven.

## Consequences
- Matches the toolchain used at EasyReach Solutions (transferable muscle memory).
- Slower incremental builds vs Gradle, acceptable at this project size.
- Easier IDE support across IntelliJ and VSCode.
- Wider familiarity for reviewers and future contributors.
