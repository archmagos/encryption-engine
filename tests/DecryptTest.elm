module DecryptTest exposing (decrypttest, firsthalf, secondhalf)

import Decrypt exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)



-- Tests that first half of a string is returned as a list of chars


firsthalf : Test
firsthalf =
    describe "getFirstHalf"
        [ test "should return a list of chars from first half of string" <|
            \_ ->
                getFirstHalf "Test"
                    |> Expect.equal [ "T", "e" ]
        , test "should return the first chars rounded down if string length is odd" <|
            \_ ->
                getFirstHalf "Bitcoin"
                    |> Expect.equal [ "B", "i", "t" ]
        ]



-- Tests that second half of a string is returned as a list of chars


secondhalf : Test
secondhalf =
    describe "getSecondHalf"
        [ test "should return a list of chars from second half of string" <|
            \_ ->
                getSecondHalf "Test"
                    |> Expect.equal [ "s", "t" ]
        , test "should return the second chars plus one if string length is odd" <|
            \_ ->
                getSecondHalf "Bitcoin"
                    |> Expect.equal [ "c", "o", "i", "n" ]
        ]



-- Tests that decryptString function produces accurate string


decrypttest : Test
decrypttest =
    describe "decryptString"
        [ test "should return an accurately decrypted string" <|
            \_ ->
                decryptString "hsi  etTi sats!"
                    |> Expect.equal "This is a test!"
        ]
