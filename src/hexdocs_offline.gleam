import hexdocs_offline/config.{type Config, default_config}
import hexdocs_offline/toml
import simplifile as fs

pub fn main() {
  let config = default_config()
  generate(config)
}

pub fn generate(conf: Config) {
  let assert Ok(_) = fs.create_directory_all(conf.docs_dir)

  let assert Ok(deps) = toml.get_deps(conf)

  // todo as "goto hexdocs and make request to docs"
  // todo as "recursively fetch all links and put into html"
  // todo as "put all into hexdocs folder"
  // todo as "create index page that links to the dep docs"

  Ok(Nil)
}
