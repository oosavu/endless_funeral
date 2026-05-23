use serde::Serialize;
use time::Date;

#[derive(Serialize, sqlx::FromRow)]
pub struct Project {
    pub id: i32,
    pub name: String,
    pub description: Option<String>,
    pub started_at: Date,
    pub abandoned_at: Option<Date>,
    pub lines_of_code: i32,
    pub confidence_level: i32,
    pub reason_id: Option<i32>,
}
