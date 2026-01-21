INSERT INTO fact_web_events (
    web_event_id,
    account_id,
    occurred_at,
    channel
)
SELECT
    id::INT,
    account_id::INT,
    occurred_at::TIMESTAMP,
    channel
FROM raw_web_events;
