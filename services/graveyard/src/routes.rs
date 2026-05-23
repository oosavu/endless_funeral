use axum::{
    extract::{Path, State},
    http::StatusCode,
    response::IntoResponse,
    Json,
};
use sqlx::PgPool;

use crate::models::Project;

pub async fn get_projects(State(pool): State<PgPool>) -> impl IntoResponse {
    match sqlx::query_as!(Project, "SELECT * FROM projects ORDER BY id")
        .fetch_all(&pool)
        .await
    {
        Ok(projects) => (StatusCode::OK, Json(projects)).into_response(),
        Err(_) => StatusCode::INTERNAL_SERVER_ERROR.into_response(),
    }
}

pub async fn get_project(
    State(pool): State<PgPool>,
    Path(id): Path<i32>,
) -> impl IntoResponse {
    match sqlx::query_as!(Project, "SELECT * FROM projects WHERE id = $1", id)
        .fetch_optional(&pool)
        .await
    {
        Ok(Some(project)) => (StatusCode::OK, Json(project)).into_response(),
        Ok(None) => StatusCode::NOT_FOUND.into_response(),
        Err(_) => StatusCode::INTERNAL_SERVER_ERROR.into_response(),
    }
}
