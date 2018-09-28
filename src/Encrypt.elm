module Encrypt exposing (encryptString, getEvenChars, getOddChars, scrambleChars)

import Helpers exposing (..)



-- Basic function splits and then returns a string, just to test output and parameter expectations are accurate


encryptString : String -> String
encryptString string =
    string
        |> String.split ""
        |> scrambleChars
        |> String.concat



-- Strips odd and even chars into individual Lists and combines them


scrambleChars : List list -> List list
scrambleChars list =
    List.append (getOddChars list) (getEvenChars list)



-- Function returns a list of every other (odd) chars


getOddChars : List list -> List list
getOddChars list =
    list
        |> List.indexedMap
            (\index value ->
                if isOdd index then
                    Just value

                else
                    Nothing
            )
        |> List.filterMap identity



-- Function returns a list of even chars


getEvenChars : List list -> List list
getEvenChars list =
    list
        |> List.indexedMap
            (\index value ->
                if isOdd index == False then
                    Just value

                else
                    Nothing
            )
        |> List.filterMap identity
