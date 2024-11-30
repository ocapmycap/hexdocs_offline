import hexdocs_offline.{generate}
import hexdocs_offline/config.{
  default_config, with_include_dev, with_output_path,
}

pub fn main() {
  let config =
    default_config()
    |> with_output_path("./CUSTOM_HEXDOCS.html")
    |> with_include_dev(False)

  generate(config)
}
