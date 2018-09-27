module Decrypt exposing (decryptString)

-- Basic function splits and then returns a string, just to test output and parameter expectations are accurate


decryptString : String -> String
decryptString string =
    string
        |> String.split ""
        |> String.concat
