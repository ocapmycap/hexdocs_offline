////
//// This module holds the main Config record type.
//// It is used to identify the parameters of which `gleam.toml` file
//// to use and where to put the resulting html files.
////

pub type Config {
  Config(
    file_path: String,
    index_path: String,
    include_dev: Bool,
    ignore_deps: List(String),
    hex_home: String,
  )
}

pub fn default_hex_home() {
  "~/.hex"
}

pub fn default_file_path() {
  "./gleam.toml"
}

pub fn default_index_path() {
  "./HEXDOCS.html"
}

pub fn default_config() -> Config {
  Config(
    file_path: default_file_path(),
    index_path: default_index_path(),
    hex_home: default_hex_home(),
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

pub fn with_hex_home(config: Config, hex_home: String) -> Config {
  Config(..config, hex_home:)
}

pub fn with_index_path(config: Config, index_path: String) -> Config {
  Config(..config, index_path:)
}

pub fn with_include_dev(config: Config, include_dev: Bool) -> Config {
  Config(..config, include_dev:)
}
