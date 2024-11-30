import gleam/list
import gleam/result
import hexdocs_offline/toml

pub fn main() {
  let config = Config(docs_dir: "", ignore_deps: [])
  generate(config)
}

pub type Config {
  Config(docs_dir: String, ignore_deps: List(String))
}

pub fn ignore_dep(config: Config, dep: String) -> Config {
  let ignore_deps = config.ignore_deps |> list.append([dep])
  Config(..config, ignore_deps:)
}

pub fn with_docs_dir(config: Config, docs_dir: String) -> Config {
  Config(..config, docs_dir:)
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
