CREATE TABLE technologies (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL CHECK (category IN ('language', 'framework', 'database', 'tool'))
);

INSERT INTO technologies (name, category) VALUES
    ('Rust', 'language'),
    ('Python', 'language'),
    ('TypeScript', 'language'),
    ('Go', 'language'),
    ('Axum', 'framework'),
    ('React', 'framework'),
    ('Next.js', 'framework'),
    ('PostgreSQL', 'database'),
    ('Redis', 'database'),
    ('Docker', 'tool'),
    ('Kubernetes', 'tool');
