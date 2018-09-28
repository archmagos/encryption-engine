module DecryptTest exposing (decrypttest, firsthalf, secondhalf, halve)

import Decrypt exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)



firsthalf : Test
firsthalf =
    describe "getFirstHalf"
        [ test "should return a List of chars from first half of String" <|
            \_ ->
                getFirstHalf "Test"
                    |> Expect.equal [ "T", "e" ]
        , test "should return chars rounded down if String length is odd" <|
            \_ ->
                getFirstHalf "Bitcoin"
                    |> Expect.equal [ "B", "i", "t" ]
        ]



secondhalf : Test
secondhalf =
    describe "getSecondHalf"
        [ test "should return a List of chars from second half of String" <|
            \_ ->
                getSecondHalf "Test"
                    |> Expect.equal [ "s", "t" ]
        , test "should include additional char if String length is odd" <|
            \_ ->
                getSecondHalf "Bitcoin"
                    |> Expect.equal [ "c", "o", "i", "n" ]
        ]



halve : Test
halve =
    describe "halveLength"
        [ test "should return half the length of String if length is even" <|
            \_ ->
                halveLength "test"
                    |> Expect.equal 2
        , test "should return half the length of String rounded down if odd" <|
            \_ ->
                halveLength "bitcoin"
                    |> Expect.equal 3
        ]



decrypttest : Test
decrypttest =
    describe "decryptString"
        [ test "should return an accurately decrypted String" <|
            \_ ->
                decryptString 1 "hsi  etTi sats!"
                    |> Expect.equal "This is a test!"
        , test "can be called n number of times" <|
            \_ ->
                decryptString 2 "s eT ashi tist!"
                    |> Expect.equal "This is a test!"
        ]
