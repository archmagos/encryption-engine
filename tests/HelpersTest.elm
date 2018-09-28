module HelpersTest exposing (halve, odd)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Helpers exposing (..)
import Test exposing (..)



-- Tests that odd and even booleans return correctly


odd : Test
odd =
    describe "isOdd"
        [ test "should return true if number is odd" <|
            \_ ->
                isOdd 3
                    |> Expect.equal True
        , test "should return false if number is even" <|
            \_ ->
                isOdd 4
                    |> Expect.equal False
        ]



-- Tests that strings are split in half (without remainder)


halve : Test
halve =
    describe "halveLength"
        [ test "should return half length of string if even" <|
            \_ ->
                halveLength "test"
                    |> Expect.equal 2
        , test "should return half length of string rounded down if odd" <|
            \_ ->
                halveLength "bitcoin"
                    |> Expect.equal 3
        ]
