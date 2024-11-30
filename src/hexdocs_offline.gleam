import gleam/result
import hexdocs_offline/config.{type Config, default_config}
import hexdocs_offline/toml

pub fn main() {
  let config = default_config()
  generate(config)
}

pub fn generate(config: Config) {
  use deps <- result.try(toml.get_deps())

  Ok(Nil)
  // todo as "filter out non-hex dependencies (f.e. internal)"
  // todo as "goto hexdocs and make request to docs"
  // todo as "recursively fetch all links and put into html"
  // todo as "put all into hexdocs folder"
  // todo as "create index page that links to the dep docs"
}
