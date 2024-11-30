////
//// This module holds the main Config record type.
//// It is used to identify the parameters of which `gleam.toml` file
//// to use and where to put the resulting html files.
////

pub type Config {
  Config(
    manifest_path: String,
    gleam_path: String,
    output_path: String,
    include_dev: Bool,
    new_tab: Bool,
    ignore_deps: List(String),
    hex_home: String,
  )
}

/// read more here: https://hexdocs.pm/hex/Mix.Tasks.Hex.Config.html
pub fn default_hex_home() {
  "~/.hex"
}

pub fn default_gleam_path() {
  "./gleam.toml"
}

pub fn default_manifest_path() {
  "./manifest.toml"
}

pub fn default_output_path() {
  "./HEXDOCS.html"
}

pub fn default_config() -> Config {
  Config(
    manifest_path: default_manifest_path(),
    gleam_path: default_gleam_path(),
    output_path: default_output_path(),
    hex_home: default_hex_home(),
    new_tab: True,
    include_dev: True,
    ignore_deps: [],
  )
}

pub fn with_ignore_deps(config: Config, ignore_deps: List(String)) -> Config {
  Config(..config, ignore_deps:)
}

pub fn with_file_path(config: Config, manifest_path: String) -> Config {
  Config(..config, manifest_path:)
}

pub fn with_hex_home(config: Config, hex_home: String) -> Config {
  Config(..config, hex_home:)
}

pub fn with_gleam_path(config: Config, gleam_path: String) -> Config {
  Config(..config, gleam_path:)
}

pub fn with_output_path(config: Config, output_path: String) -> Config {
  Config(..config, output_path:)
}

pub fn with_include_dev(config: Config, include_dev: Bool) -> Config {
  Config(..config, include_dev:)
}

pub fn with_new_tab(config: Config, new_tab: Bool) -> Config {
  Config(..config, new_tab:)
}
