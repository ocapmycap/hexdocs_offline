# Hexdocs Offline

Download an offline version of the hexdocs of your projects dependencies to a local folder.

# Demo

TODO

# Platform Support

This package supports both the `erlang` and `javascript` target.

# Usage

## Installation
```sh
gleam add hexdocs_offline --dev
```

## Option 1: Default Config
```sh
gleam run -m hexdocs_offline
```

This will generate the hexdocs with the default configuration:
- file_path: `./gleam.toml`
- config_dir: `./hexdocs`
- include_dev: `True` *((includes dev dependencies)*
- ignore_deps: `[]` *(take all dependencies into consideration)*

## Option 2: Custom Config
```gleam
//// file `hexdocs/generate_hexdocs.gleam`
import hexdocs_offline.{generate}
import hexdocs_offline/config.{Config, default_file_path}

pub fn main() {
  let config = Config(
    file_path: default_file_path(),
    docs_dir: "./docs/hex",
    include_dev: False,
    ignore_deps: []
  )
  generate(config)
}
```

```sh
gleam run -m generate_hexdocs
```

# Notices
- you might want to add the resulting `hexdocs` directory to your `.gitignore`

# Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```

# Acknowledgements

- Thank you to `go_over` ([Hex](https://hex.pm/packages/go_over), [GitHub](https://github.com/bwireman/go-over)) for inspiring the code that reads out the `gleam.toml` file
- Thank you to `squirrel` ([Hex](https://hex.pm/packages/squirrel), [GitHub](https://github.com/giacomocavalieri/squirrel)) for a lot of the code and repository structure inspiration

# License
[Apache License, Version 2.0](./LICENSE)
