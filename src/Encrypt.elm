module Encrypt exposing (..)

-- Basic function splits and then returns a string, just to test output and parameter expectations are accurate

encryptString string =
  string
    |> String.split ""
    -- |> scrambleChars
    |> String.concat

-- For use in mapping the List of string chars, to determine whether char index is odd or even

isOdd index =
  if modBy 2 index /= 0 then True else False


-- Function returns a list of every other char

getOddChars list =
  list
    |> List.indexedMap (\ index value -> if isOdd index then Just value else Nothing)
    |> List.filterMap identity
