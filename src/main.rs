#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;

#[get("/")]
fn hello() -> String {
    format!("Hello World!")
}

// Hosts on port 8000
fn main() {
    rocket::ignite().mount("/", routes![hello]).launch();
}
