module Encrypt exposing (..)

-- Basic function splits and then returns a string, just to test output and parameter expectations are accurate

encryptString string =
  string
    |> String.split ""
    |> scrambleChars
    |> String.concat

-- For use in mapping the List of string chars, to determine whether char index is odd or even

isOdd number =
  if modBy 2 number /= 0 then True else False

-- Basic function to check that index value mapping interacts appropriately with isOdd function

scrambleChars list =
  list
    |> List.indexedMap (\ index value -> if isOdd index then "test" else value)
