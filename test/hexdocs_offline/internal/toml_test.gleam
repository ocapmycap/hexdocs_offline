import gleeunit
import gleeunit/should
import hexdocs_offline/config
import hexdocs_offline/internal/toml

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
    toml.Dependency(name: "gleam_stdlib", version: "0.45.0"),
    toml.Dependency(name: "glexec", version: "1.0.3"),
    toml.Dependency(name: "nakai", version: "1.1.1"),
    toml.Dependency(name: "simplifile", version: "2.2.0"),
    toml.Dependency(name: "tom", version: "1.1.0"),
    toml.Dependency(name: "gleeunit", version: "1.2.0"),
  ])

  let conf = config.with_include_dev(conf, False)
  let assert Ok(deps) = toml.get_deps(conf)
  should.equal(deps, [
    toml.Dependency(name: "gleam_stdlib", version: "0.45.0"),
    toml.Dependency(name: "glexec", version: "1.0.3"),
    toml.Dependency(name: "nakai", version: "1.1.1"),
    toml.Dependency(name: "simplifile", version: "2.2.0"),
    toml.Dependency(name: "tom", version: "1.1.0"),
  ])

  let conf =
    conf
    |> config.with_include_dev(True)
    |> config.with_ignore_deps(["gleam_stdlib"])
  let assert Ok(deps) = toml.get_deps(conf)
  should.equal(deps, [
    toml.Dependency(name: "glexec", version: "1.0.3"),
    toml.Dependency(name: "nakai", version: "1.1.1"),
    toml.Dependency(name: "simplifile", version: "2.2.0"),
    toml.Dependency(name: "tom", version: "1.1.0"),
    toml.Dependency(name: "gleeunit", version: "1.2.0"),
  ])
}
