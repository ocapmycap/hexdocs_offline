# Hexdocs Offline

## TODO
- [ ] inspiration for readme
- [ ] module & function docs
- [ ] inspiration main function
- [ ] examples directory
- [ ] testing
- [ ] internal package

## Usage
```gleam
//// file `hexdocs/generate_hexdocs.gleam`
import hexdocs_offline.{generate, Config}

pub fn main() }
  let config = Config(
    file_path: "test",
    docs_dir: "",
    ignore_deps: []
  )
  generate(config)
}
```

```sh
gleam run -m generate_hexdocs
```

## CLI
- add hexdocs dir to .gitignore
- add config to ignore certain deps
- name/path of directory

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```

## Acknowledgements

- Thank you to `go_over` ([Hex](https://hex.pm/packages/go_over), [GitHub](https://github.com/bwireman/go-over)) for inspiring the code that reads out the `gleam.toml` file
