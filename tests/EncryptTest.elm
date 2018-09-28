module EncryptTest exposing (encrypt, geteven, getodd)

import Encrypt exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)



-- Test to check that odd chars are returned as a List


getodd : Test
getodd =
    describe "getOddChars"
        [ test "should return list" <|
            \_ ->
                getOddChars [ "A", "B", "C" ]
                    |> Expect.equal [ "B" ]
        ]



-- Test to check that even chars are returned as a List


geteven : Test
geteven =
    describe "getEvenChars"
        [ test "should return list" <|
            \_ ->
                getEvenChars [ "A", "B", "C" ]
                    |> Expect.equal [ "A", "C" ]
        ]



-- Tests that encryptString function produces accurate scramble


encrypt : Test
encrypt =
    describe "encryptString"
        [ test "should return a string" <|
            \_ ->
                encryptString 1 "This is a test!"
                    |> Expect.equal "hsi  etTi sats!"
        , test "can be called n number of times" <|
            \_ ->
                encryptString 3 "This is a test!"
                    |> Expect.equal " Tah itse sits!"
        ]
