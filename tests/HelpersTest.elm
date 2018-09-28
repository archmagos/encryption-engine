module HelpersTest exposing (odd)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Helpers exposing (..)
import Test exposing (..)



odd : Test
odd =
    describe "isOdd"
        [ test "should return True if Integer is odd" <|
            \_ ->
                isOdd 3
                    |> Expect.equal True
        , test "should return False if integer is even" <|
            \_ ->
                isOdd 4
                    |> Expect.equal False
        ]
