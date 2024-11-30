////
//// This module contains the function to read out the gleam.toml and
//// the contained dependencies.
//// Inspired by https://github.com/bwireman/go-over/blob/main/src/go_over/config.gleam
////

import gleam/dict
import gleam/list
import gleam/result.{unwrap}
import hexdocs_offline/config.{type Config}
import simplifile
import tom

pub fn get_deps(config: Config) -> Result(List(String), Nil) {
  use contents <- result.try(
    result.map_error(simplifile.read(config.file_path), fn(_) { Nil }),
  )
  use parsed <- result.try(result.map_error(tom.parse(contents), fn(_) { Nil }))

  let deps =
    tom.get_table(parsed, ["dependencies"])
    |> unwrap(dict.new())
    |> dict.keys()

  let result = case config.include_dev {
    True -> {
      let dev_deps =
        tom.get_table(parsed, ["dev-dependencies"])
        |> unwrap(dict.new())
        |> dict.keys()

      list.append(deps, dev_deps)
    }
    False -> deps
  }

  result
  |> filter_deps(config.ignore_deps)
  |> Ok
}

fn filter_deps(deps: List(String), ignore: List(String)) -> List(String) {
  case ignore {
    [] -> deps
    [head, ..rest] -> {
      list.filter(deps, fn(dep) { dep != head })
      |> filter_deps(rest)
    }
  }
}
