CREATE TABLE revival_attempts (
    id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    attempted_at DATE NOT NULL,
    motivation_level INTEGER NOT NULL CHECK (motivation_level BETWEEN 1 AND 10),
    lasted_days INTEGER NOT NULL DEFAULT 0,
    outcome TEXT NOT NULL CHECK (outcome IN ('abandoned_again', 'still_going', 'merged_into_another'))
);
