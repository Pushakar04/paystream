# 1. Record architecture decisions

Date: $(date +%Y-%m-%d)

## Status
Accepted

## Context
We need to record the architectural decisions made on this project so that
future-us and code reviewers can understand *why* the system looks the way it does,
not just *what* it does.

## Decision
We will use Architecture Decision Records (ADRs) as described by Michael Nygard.
Each ADR is a short Markdown file numbered sequentially.

## Consequences
- All non-trivial decisions get a corresponding ADR.
- ADRs are immutable once accepted. Superseded decisions get a new ADR that
  references the old one.
