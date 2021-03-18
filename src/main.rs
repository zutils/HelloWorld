#![feature(proc_macro_hygiene, decl_macro)]
#![allow(clippy::useless_format)]

#[macro_use] extern crate rocket;

#[get("/")]
fn hello() -> String {
    format!("Hello Final Test Success!")
}

// Hosts on port 8000
fn main() {
    rocket::ignite().mount("/", routes![hello]).launch();
}
