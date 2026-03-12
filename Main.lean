module

import Mathsforces
import Std.Internal.Http

open Std Internal IO Async
open Std Http Server

structure MyHandler

instance : Handler MyHandler where
  onRequest _ req := do
    let uri := req.line.uri
    let response := match uri with
    | .originForm path query => s!"originForm {path} {query}"
    | .absoluteForm uri noFrag => s!"absoluteForm {uri}"
    | .authorityForm authority => s!"authorityForm {authority}"
    | .asteriskForm => s!"asteriskFOrm"

    Response.ok |>.text response

public def main : IO Unit := Async.block do
  let addr : Net.SocketAddress := .v4 ⟨.ofParts 127 0 0 1, 8000⟩
  let server ← Server.serve addr MyHandler.mk
  server.waitShutdown
