import gleeunit
import gleeunit/should
import hexdocs_offline/toml

pub fn main() {
  gleeunit.main()
}

pub fn parse_test() {
  let assert Ok(deps) = toml.get_deps()

  should.equal(deps, [
    "gleam_http", "gleam_httpc", "gleam_stdlib", "simplifile", "tom",
  ])
}
