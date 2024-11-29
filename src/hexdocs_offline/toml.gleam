import gleam/string

pub fn find_gleam_toml() {
  todo as "find closest gleam toml"
}

fn parse_rec(lines: List(String), acc: List(String)) -> List(String) {
  case lines {
    [head, ..rest] -> acc
    [head] -> acc
    [] -> acc
  }
}

pub fn parse(contents: String) -> List(String) {
  let lines = string.split(contents, "\n")
  parse_rec(lines, [])
}
