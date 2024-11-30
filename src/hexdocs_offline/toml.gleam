////
//// Inspired by https://github.com/bwireman/go-over/blob/main/src/go_over/config.gleam
////

import gleam/dict
import gleam/list
import gleam/result.{unwrap}
import simplifile
import tom

pub fn get_deps() -> Result(List(String), Nil) {
  use contents <- result.try(
    result.map_error(simplifile.read("./gleam.toml"), fn(_) { Nil }),
  )
  use parsed <- result.try(result.map_error(tom.parse(contents), fn(_) { Nil }))

  let deps =
    tom.get_table(parsed, ["dependencies"])
    |> unwrap(dict.new())
    |> dict.keys()

  let dev_deps =
    tom.get_table(parsed, ["dev_dependencies"])
    |> unwrap(dict.new())
    |> dict.keys()

  deps
  |> list.append(dev_deps)
  |> Ok
}
