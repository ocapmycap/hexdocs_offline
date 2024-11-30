import gleam/io
import gleam/string
import glexec as exec
import hexdocs_offline/config.{type Config, default_config}
import hexdocs_offline/toml

pub fn main() {
  let config = default_config()
  generate(config)
}

pub fn generate(conf: Config) {
  let assert Ok(deps) = toml.get_deps(conf)

  let assert Ok(_) = download_docs(deps)
  let assert Ok(_) = ensure_permissions(conf, deps)
}

fn download_docs(deps: List(String)) -> Result(Nil, Nil) {
  case deps {
    [dep, ..rest] -> {
      let cmd = exec.Shell("mix hex.docs fetch " <> dep)
      let assert Ok(out) =
        exec.new() |> exec.with_stdout(exec.StdoutCapture) |> exec.run_sync(cmd)
      io.debug(out)

      download_docs(rest)
    }
    [] -> Ok(Nil)
  }
}

fn ensure_permissions(conf: Config, deps: List(String)) -> Result(Nil, Nil) {
  case deps {
    [dep, ..rest] -> {
      let path = get_docs_path(conf, dep)
      let cmd = exec.Shell("chmod -R u+rwX " <> path)
      let assert Ok(_) = exec.new() |> exec.run_sync(cmd)

      ensure_permissions(conf, rest)
    }
    [] -> Ok(Nil)
  }
}

fn get_docs_path(conf: Config, dep: String) -> String {
  let home = remove_trailing_slash(conf.hex_home)
  home <> "/docs/hexpm/" <> dep
}

fn remove_trailing_slash(value: String) -> String {
  case string.ends_with(value, "/") {
    False -> value
    True -> string.drop_end(value, 1)
  }
}
