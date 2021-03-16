#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;

#[get("/")]
fn hello() -> String {
    format!("Hello World!".to_string())
}

// Hosts on port 8000
fn main() {
    rocket::ignite().mount("/", routes![hello]).launch();
}

lintfail;