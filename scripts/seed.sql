-- Очищаем перед посевом (порядок важен из-за FK)
TRUNCATE revival_attempts, project_technologies, projects RESTART IDENTITY CASCADE;

-- 10 проектов
INSERT INTO projects (name, description, started_at, abandoned_at, lines_of_code, confidence_level, reason_id) VALUES
    ('Uber для котов',         'Маркетплейс для выгула котов с рейтингом котов',         '2023-01-01', '2023-01-04', 47,   10, 1),
    ('Blockchain кофемашина',  'Децентрализованный учёт зерён эспрессо',                  '2022-06-01', '2022-06-03', 12,   9,  2),
    ('AI диетолог',            'ИИ советует что поесть на основе фото холодильника',       '2023-03-10', '2023-03-28', 340,  8,  3),
    ('Антисоциальная сеть',    'Соцсеть где нельзя лайкать и комментировать',             '2021-11-01', '2022-01-15', 1203, 7,  8),
    ('DachaCoin',              'Криптовалюта обеспеченная урожаем огурцов',                '2021-05-01', '2021-05-02', 8,    10, 3),
    ('Умный будильник',        'Будит только когда выспался, анализируя храп',             '2022-09-01', '2022-10-30', 892,  6,  6),
    ('Tinder для стеков',      'Матчит разработчиков по технологиям а не внешности',      '2023-07-14', '2023-07-17', 55,   9,  4),
    ('Агрегатор мемов v3',     'Третья попытка сделать агрегатор мемов',                  '2024-01-01', '2024-02-20', 2100, 5,  7),
    ('Компилятор русского',    'Пишешь на русском — компилируется в Python',              '2020-04-01', '2020-04-03', 23,   10, 5),
    ('Планировщик задач v12',  'Двенадцатый собственный todo-app, на этот раз серьёзно',  '2024-06-01', NULL,         4400, 3,  NULL);

-- project_technologies (technologies: 1=Rust,2=Python,3=TypeScript,4=Go,5=Axum,6=React,7=Next.js,8=PostgreSQL,9=Redis,10=Docker,11=Kubernetes)
INSERT INTO project_technologies (project_id, technology_id) VALUES
    (1,  2),  -- Uber для котов: Python
    (1,  6),  -- Uber для котов: React
    (2,  3),  -- Blockchain кофемашина: TypeScript
    (2,  8),  -- Blockchain кофемашина: PostgreSQL
    (3,  2),  -- AI диетолог: Python
    (3,  9),  -- AI диетолог: Redis
    (4,  4),  -- Антисоциальная сеть: Go
    (4,  7),  -- Антисоциальная сеть: Next.js
    (4,  8),  -- Антисоциальная сеть: PostgreSQL
    (5,  3),  -- DachaCoin: TypeScript
    (6,  1),  -- Умный будильник: Rust
    (7,  3),  -- Tinder для стеков: TypeScript
    (7,  7),  -- Tinder для стеков: Next.js
    (8,  2),  -- Агрегатор мемов: Python
    (8, 10),  -- Агрегатор мемов: Docker
    (9,  2),  -- Компилятор русского: Python
    (10, 1),  -- Планировщик задач: Rust
    (10, 5),  -- Планировщик задач: Axum
    (10, 8);  -- Планировщик задач: PostgreSQL

-- revival_attempts для нескольких проектов
INSERT INTO revival_attempts (project_id, attempted_at, motivation_level, lasted_days, outcome) VALUES
    (1, '2023-06-01', 8,  2,  'abandoned_again'),
    (1, '2023-12-31', 10, 1,  'abandoned_again'),
    (3, '2023-09-01', 7,  14, 'abandoned_again'),
    (4, '2022-03-01', 9,  3,  'abandoned_again'),
    (4, '2023-01-01', 6,  1,  'abandoned_again'),
    (8, '2024-03-15', 9,  5,  'merged_into_another'),
    (9, '2021-01-01', 10, 1,  'abandoned_again');
