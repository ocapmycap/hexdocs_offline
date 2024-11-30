import hexdocs_offline.{generate}
import hexdocs_offline/config.{
  default_config, with_ignore_deps, with_include_dev, with_index_path,
}

pub fn main() {
  let config =
    default_config()
    |> with_index_path("HEXDOCS.html")
    |> with_include_dev(False)
    |> with_ignore_deps(["..."])

  generate(config)
}
