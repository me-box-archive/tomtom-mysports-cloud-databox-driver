open Lwt
open Cohttp
open Cohttp_lwt_unix

let server =
  let headers = Header.init_with "Access-Control-Allow-Origin" "*" in
  let callback _conn req body =
    let uri = req |> Request.uri |> Uri.to_string in
    let meth = req |> Request.meth |> Code.string_of_method in
    let hdrs = req |> Request.headers |> Header.to_string in
    Printf.printf "Uri: %s\nMethod: %s\nHeaders\nHeaders: %s\n%!"
         uri meth hdrs;
    Server.respond_string ~headers ~status:`OK ~body:"active" ()
  in
  Server.create ~mode:(`TCP (`Port 80)) (Server.make ~callback ())
