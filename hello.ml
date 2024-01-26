type t = { msg: string }

let hello_world name r =
  print_endline "hello";
  print_endline name;
  print_endline r.msg

let () =
  let m = read_line () in
  hello_world m { msg = m }
