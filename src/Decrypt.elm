module Decrypt exposing (..)

-- Basic function splits and then returns a string, just to test output and parameter expectations are accurate

decryptString string =
  string
    |> String.split ""
    |> String.concat
