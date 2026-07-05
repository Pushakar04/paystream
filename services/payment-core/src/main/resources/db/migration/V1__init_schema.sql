-- Paystream initial schema
-- All monetary amounts stored as minor units (paise / cents) in BIGINT.
-- All timestamps in UTC.

CREATE TABLE merchants (
    id                BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    public_id         CHAR(36)        NOT NULL,
    name              VARCHAR(255)    NOT NULL,
    api_key_hash      CHAR(64)        NOT NULL,
    webhook_url       VARCHAR(1024)   NULL,
    webhook_secret    VARCHAR(255)    NULL,
    is_active         BOOLEAN         NOT NULL DEFAULT TRUE,
    created_at        DATETIME(6)     NOT NULL,
    updated_at        DATETIME(6)     NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_merchants_public_id (public_id),
    UNIQUE KEY uk_merchants_api_key_hash (api_key_hash)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE payments (
    id                    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    public_id             CHAR(36)        NOT NULL,
    merchant_id           BIGINT UNSIGNED NOT NULL,
    idempotency_key       VARCHAR(128)    NOT NULL,
    amount_minor_units    BIGINT          NOT NULL,
    currency              CHAR(3)         NOT NULL,
    status                VARCHAR(32)     NOT NULL,
    customer_reference    VARCHAR(255)    NULL,
    pan_masked            VARCHAR(19)     NULL,
    acquirer_reference    VARCHAR(128)    NULL,
    failure_reason        VARCHAR(255)    NULL,
    created_at            DATETIME(6)     NOT NULL,
    updated_at            DATETIME(6)     NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_payments_public_id (public_id),
    UNIQUE KEY uk_payments_merchant_idem (merchant_id, idempotency_key),
    KEY idx_payments_status (status),
    KEY idx_payments_created_at (created_at),
    CONSTRAINT fk_payments_merchant FOREIGN KEY (merchant_id) REFERENCES merchants(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE payment_events (
    id             BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    payment_id     BIGINT UNSIGNED NOT NULL,
    event_type     VARCHAR(64)     NOT NULL,
    from_status    VARCHAR(32)     NULL,
    to_status      VARCHAR(32)     NULL,
    payload_json   JSON            NULL,
    created_at     DATETIME(6)     NOT NULL,
    PRIMARY KEY (id),
    KEY idx_events_payment (payment_id, created_at),
    CONSTRAINT fk_events_payment FOREIGN KEY (payment_id) REFERENCES payments(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
