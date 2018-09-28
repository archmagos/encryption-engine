module Decrypt exposing (decryptString, getFirstHalf, getSecondHalf)

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



-- Function returns a list containing chars from the second half of string


getSecondHalf : String -> List String
getSecondHalf string =
    if isOdd (String.length string) then
        String.right (halveLength string + 1) string
            |> String.split ""

    else
        String.right (halveLength string) string
            |> String.split ""
