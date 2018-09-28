module Helpers exposing (isOdd)

-- Basic boolean function used in both Encryption and Decryption modules.


isOdd : Int -> Bool
isOdd index =
    if modBy 2 index /= 0 then
        True

    else
        False
