module Encrypt exposing (..)

-- Basic function splits and then returns a string, just to test output and parameter expectations are accurate

encryptString string =
  string
    |> String.split ""
    |> String.concat
