import gleeunit
import hexdocs_offline/toml

pub fn main() {
  gleeunit.main()
}

fn sample_toml() {
  "name = \"hexdocs_offline\"\n"
  <> "version = \"1.0.0\"\n"
  <> "\n"
  <> "[dependencies]\n"
  <> "gleam_stdlib = \">= 0.34.0 and < 2.0.0\"\n"
  <> "gleam_httpc = \">= 3.0.0 and < 4.0.0\"\n"
  <> "gleam_http = \">= 3.7.1 and < 4.0.0\"\n"
  <> "simplifile = \">= 2.2.0 and < 3.0.0\"\n"
  <> "\n"
  <> "[dev-dependencies]\n"
  <> "gleeunit = \">= 1.0.0 and < 2.0.0\""
}

pub fn parse_test() {
  let parsed = toml.parse(sample_toml())
}
