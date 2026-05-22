CREATE TABLE abandonment_reasons (
    id SERIAL PRIMARY KEY,
    reason TEXT NOT NULL,
    category TEXT NOT NULL CHECK (category IN (
        'boredom',
        'shiny_object',
        'reality_check',
        'life_happened',
        'skill_issue',
        'scope_creep'
    ))
);

INSERT INTO abandonment_reasons (reason, category) VALUES
    ('Стало скучно на третий день', 'boredom'),
    ('Нашёл более крутой фреймворк', 'shiny_object'),
    ('Оказывается это уже существует', 'reality_check'),
    ('Работа навалилась', 'life_happened'),
    ('Слишком сложно, потом разберусь', 'skill_issue'),
    ('Проект вырос до размеров NASA', 'scope_creep'),
    ('Вышла новая версия языка, надо переписать', 'shiny_object'),
    ('Понял что монетизации нет', 'reality_check');
