module Helpers exposing (..)



-- For use in mapping the List of string chars, to determine whether char index is odd or even


isOdd : Int -> Bool
isOdd index =
    if modBy 2 index /= 0 then
        True

    else
        False
