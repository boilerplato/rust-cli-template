extern crate rust_cli_template;
use clap::{App, Arg};
use colored::*;

fn main() {
    let matches = App::new("rust_cli_template")
        .version(env!("CARGO_PKG_VERSION"))
        .version_short("v")
        .author("Rousan Ali <hello@rousan.io> (https://rousan.io)")
        .about("A Boilerplato template for Rust CLI application.")
        .arg(
            Arg::with_name("filePath")
                .help("A file path to see size")
                .value_name("FILE_PATH")
                .index(1)
                .required(true),
        )
        .arg(
            Arg::with_name("format")
                .short("f")
                .long("format")
                .value_name("FORMAT")
                .help("Specify a format to see file sie e.g. 'kb' or 'b'")
                .takes_value(true)
                .required(true),
        )
        .get_matches();

    let file_path = matches.value_of("filePath").unwrap();
    let format = matches.value_of("format").unwrap();

    match rust_cli_template::file_size::human_readable_file_size(file_path.as_ref(), format) {
        Ok(size) => println!("File size: {}", size),
        Err(err) => eprintln!("{} {}", "error:".red(), err),
    }
}
