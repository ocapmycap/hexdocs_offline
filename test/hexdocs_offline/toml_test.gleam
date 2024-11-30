import gleeunit
import gleeunit/should
import hexdocs_offline/config
import hexdocs_offline/toml

pub fn main() {
  gleeunit.main()
}

/// tests the parsing of the gleam.toml file of this project itself
pub fn parse_test() {
  let conf =
    config.default_config()
    |> config.with_include_dev(True)
  let assert Ok(deps) = toml.get_deps(conf)
  should.equal(deps, [
    "gleam_http", "gleam_httpc", "gleam_stdlib", "simplifile", "tom", "gleeunit",
  ])

  let conf = config.with_include_dev(conf, False)
  let assert Ok(deps) = toml.get_deps(conf)
  should.equal(deps, [
    "gleam_http", "gleam_httpc", "gleam_stdlib", "simplifile", "tom",
  ])

  let conf =
    conf
    |> config.with_include_dev(True)
    |> config.with_ignore_deps(["gleam_http", "gleam_httpc"])
  let assert Ok(deps) = toml.get_deps(conf)
  should.equal(deps, ["gleam_stdlib", "simplifile", "tom", "gleeunit"])
}
