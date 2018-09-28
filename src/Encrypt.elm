module Encrypt exposing (encryptString, getEvenChars, getOddChars, scrambleChars)

import Helpers exposing (..)



{- Splits String into List, scrambles order and reassembles as a new String.
   Recursion allows encrypton to be called n number of times.
-}


encryptString : Int -> String -> String
encryptString n string =
    if n < 1 then
        string

    else
        string
            |> String.split ""
            |> scrambleChars
            |> String.concat
            |> encryptString (n - 1)



-- Combines two Lists comprising odd and even chars from original String.


scrambleChars : List list -> List list
scrambleChars list =
    List.append (getOddChars list) (getEvenChars list)



-- Returns a List of odd indexed chars taken from original String.


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



-- Returns a List of even indexed chars taken from original String.


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
