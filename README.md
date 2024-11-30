# Hexdocs Offline

## Platform Support

This package supports both the `erlang` and `javascript` target.

## Usage
```sh
gleam add hexdocs_offline --dev
```

```gleam
//// file `hexdocs/generate_hexdocs.gleam`
import hexdocs_offline.{generate, Config}

pub fn main() {
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

### Notices
- you might want to add the resulting `hexdocs` directory to your `.gitignore`

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```

## Acknowledgements

- Thank you to `go_over` ([Hex](https://hex.pm/packages/go_over), [GitHub](https://github.com/bwireman/go-over)) for inspiring the code that reads out the `gleam.toml` file
- Thank you to `squirrel` ([Hex](https://hex.pm/packages/squirrel), [GitHub](https://github.com/giacomocavalieri/squirrel)) for a lot of the code and repository structure inspiration
