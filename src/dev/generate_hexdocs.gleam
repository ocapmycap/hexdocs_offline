import hexdocs_offline.{generate}
import hexdocs_offline/config.{
  default_config, with_docs_dir, with_ignore_deps, with_include_dev,
}

pub fn main() {
  let config =
    default_config()
    |> with_docs_dir("./docs/hex")
    |> with_include_dev(False)
    |> with_ignore_deps(["..."])

  generate(config)
}
