////
//// This module holds the main Config record type.
//// It is used to identify the parameters of which `gleam.toml` file
//// to use and where to put the resulting html files.
////

pub type Config {
  Config(
    file_path: String,
    docs_dir: String,
    include_dev: Bool,
    ignore_deps: List(String),
  )
}

pub fn default_file_path() {
  "./gleam.toml"
}

pub fn default_docs_dir() {
  "./hexdocs"
}

pub fn default_config() -> Config {
  Config(
    file_path: default_file_path(),
    docs_dir: default_docs_dir(),
    include_dev: True,
    ignore_deps: [],
  )
}

pub fn with_ignore_deps(config: Config, ignore_deps: List(String)) -> Config {
  Config(..config, ignore_deps:)
}

pub fn with_file_path(config: Config, file_path: String) -> Config {
  Config(..config, file_path:)
}

pub fn with_docs_dir(config: Config, docs_dir: String) -> Config {
  Config(..config, docs_dir:)
}

pub fn with_include_dev(config: Config, include_dev: Bool) -> Config {
  Config(..config, include_dev:)
}
