import gleam/list

pub fn main() {
  todo
}

pub type Config {
  Config(file_path: String, docs_dir: String, ignore_deps: List(String))
}

pub fn ignore_dep(config: Config, dep: String) -> Config {
  let ignore_deps = config.ignore_deps |> list.append([dep])
  Config(file_path: config.file_path, docs_dir: config.docs_dir, ignore_deps:)
}

pub fn generate(config: Config) {
  todo as "get nearest gleam.toml file"
  todo as "read out all dependencies and dev_devependencies"
  todo as "filter out non-hex dependencies (f.e. internal)"
  todo as "goto hexdocs and make request to docs"
  todo as "recursively fetch all links and put into html"
  todo as "put all into hexdocs folder"
  todo as "create index page that links to the dep docs"
}
