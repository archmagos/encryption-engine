module Decrypt exposing (decryptString, getFirstHalf)

import Helpers exposing (..)



-- Basic function splits and then returns a string, just to test output and parameter expectations are accurate


decryptString : String -> String
decryptString string =
    string
        |> String.split ""
        |> String.concat



-- Function returns a list containing chars from the first half of string


getFirstHalf : String -> List String
getFirstHalf string =
    String.left (halveLength string) string
        |> String.split ""
