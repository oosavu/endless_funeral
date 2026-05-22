CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    started_at DATE NOT NULL,
    abandoned_at DATE,
    lines_of_code INTEGER NOT NULL DEFAULT 0,
    confidence_level INTEGER NOT NULL CHECK (confidence_level BETWEEN 1 AND 10),
    reason_id INTEGER REFERENCES abandonment_reasons(id)
);
