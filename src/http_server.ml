open Lwt
open Cohttp
open Cohttp_lwt_unix

let render renderer lookup =
  let buf = Buffer.create 0 in
  let ppf = Format.formatter_of_buffer buf in
  renderer ppf lookup;
  Buffer.contents buf
  
let index req body = 
  let output = render Tpl_index.render (fun _ -> "World") in
  ([("Content-Type", "text/html; charset=utf-8")], output)
  
let paths = [
  ("index.html", index);
  ("/", index)
] 

let server =
  let headers = Header.init_with "Access-Control-Allow-Origin" "*" in
  let callback _conn req body =
    let path = req |> Request.uri |> Uri.path in
    try
      List.assoc path paths |> (fun r -> 
        let (hdrs, response) = r req body in
        let headers = Header.add_list headers hdrs in
        Server.respond_string ~headers ~status:`OK ~body:response ())
     with Not_found -> 
      Server.respond_error ~headers ~status:`Not_found ~body:"" ()
  in
  fun () -> Server.create ~mode:(`TCP (`Port 8080)) (Server.make ~callback ())
