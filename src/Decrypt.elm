module Decrypt exposing (decryptString, getFirstHalf, getSecondHalf)

import Helpers exposing (..)



-- Basic function splits and then returns a string, just to test output and parameter expectations are accurate


decryptString : Int -> String -> String
decryptString n string =
    if n < 1 then
        string

    else
        assembleChars (getSecondHalf string) (getFirstHalf string)
            |> String.concat
            |> decryptString (n - 1)



-- Strips odd and even chars into individual Lists and combines them


assembleChars : List String -> List String -> List String
assembleChars listOne listTwo =
    case listOne of
        x :: list ->
            x :: assembleChars listTwo list

        _ ->
            []



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
