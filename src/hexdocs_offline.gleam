import gleam/list
import gleam/string
import glexec as exec
import hexdocs_offline/config.{type Config, default_config}
import hexdocs_offline/toml
import simplifile

pub fn main() {
  let config = default_config()
  generate(config)
}

pub fn generate(conf: Config) {
  let assert Ok(deps) = toml.get_deps(conf)

  let assert Ok(deps_with_paths) = download_docs(deps, [])
  let assert Ok(_) = ensure_permissions(conf, deps_with_paths)

  let index_file = gen_index_file(deps_with_paths)
  simplifile.write(to: conf.index_path, contents: index_file)
}

fn gen_index_file(deps: List(DownloadResult)) {
  "<!doctype html>\n"
  <> "<html lang=\"en\">\n"
  <> "<head>\n"
  <> "<meta charset=\"UTF-8\" />\n"
  <> "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n"
  <> "<title>HexDocs</title>\n"
  <> "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\">"
  <> "</head>\n"
  <> "<body>\n"
  <> "<ul>\n"
  <> list.map(deps, fn(dep) {
    let path = dep.path <> "/index.html"
    "<li><a href=\"file://" <> path <> "\">" <> dep.dep <> "</a></li>"
  })
  |> string.join("\n")
  <> "</ul>\n"
  <> "</body>\n"
  <> "</html>"
}

type DownloadResult {
  DownloadResult(dep: String, path: String)
}

fn download_docs(
  deps: List(String),
  acc: List(DownloadResult),
) -> Result(List(DownloadResult), Nil) {
  case deps {
    [dep, ..rest] -> {
      let cmd = exec.Shell("mix hex.docs fetch " <> dep)
      let assert Ok(exec.Output(out)) =
        exec.new() |> exec.with_stdout(exec.StdoutCapture) |> exec.run_sync(cmd)

      let assert [exec.Stdout(lines)] = out
      let assert [line] = lines

      let assert [_, path] =
        line
        |> string.trim()
        |> string.split(":")
        |> list.map(string.trim)

      let acc = [DownloadResult(dep:, path:), ..acc]

      download_docs(rest, acc)
    }
    [] -> Ok(acc)
  }
}

fn ensure_permissions(
  conf: Config,
  deps_with_path: List(DownloadResult),
) -> Result(Nil, Nil) {
  case deps_with_path {
    [dep, ..rest] -> {
      let cmd = exec.Shell("chmod -R u+rwX " <> dep.path)
      let assert Ok(_) = exec.new() |> exec.run_sync(cmd)

      ensure_permissions(conf, rest)
    }
    [] -> Ok(Nil)
  }
}
