mod models;
mod routes;

use axum::{routing::get, Router};
use sqlx::PgPool;

#[tokio::main]
async fn main() {
    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = PgPool::connect(&database_url).await.expect("Failed to connect to database");

    let app = Router::new()
        .route("/projects", get(routes::get_projects))
        .route("/projects/{id}", get(routes::get_project))
        .with_state(pool);

    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await.unwrap();
    println!("Listening on http://0.0.0.0:3000");
    axum::serve(listener, app).await.unwrap();
}
