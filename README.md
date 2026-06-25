# Paystream

> Distributed payment gateway built on Spring Boot, Kafka, and Redis.
> Designed for correctness, resilience, and horizontal scale to 10k TPS.

[![CI](https://github.com/Pushakar04/paystream/actions/workflows/ci.yml/badge.svg)](https://github.com/Pushakar04/paystream/actions/workflows/ci.yml)
![Java](https://img.shields.io/badge/Java-21-orange)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x-brightgreen)
![Kafka](https://img.shields.io/badge/Apache%20Kafka-3.x-black)

---

## Why this exists

Most tutorial payment systems collapse the moment you ask:
*"What happens if the request retries? If the acquirer times out mid-Saga? If Kafka rebalances during a webhook delivery?"*

Paystream is built to answer those questions in code, not slides.

## Core capabilities (in progress)

- [ ] Idempotent payment intake (Redis SETNX, 24h key TTL)
- [ ] Payment state machine: `INITIATED → AUTHORIZED → CAPTURED → SETTLED` (+ failure paths)
- [ ] Distributed Saga across 3 Kafka consumers with compensating transactions
- [ ] HMAC-SHA256 signed webhook delivery with Kafka-backed retry + DLQ
- [ ] Sliding-window rate limiting per merchant (Redis sorted sets)
- [ ] Resilience4j circuit breaker + bulkhead around acquirer
- [ ] CQRS read model projected via Kafka consumer
- [ ] Micrometer + Prometheus metrics, structured JSON logs, OpenTelemetry tracing
- [ ] Spring Security + JWT, PAN masking, input validation
- [ ] Scaling plan documented to 10k TPS

## Architecture

See [`ARCHITECTURE.md`](./ARCHITECTURE.md) and [`docs/adr/`](./docs/adr/) for decisions.

## Local setup

```bash
docker compose up -d
# instructions added Week 2
