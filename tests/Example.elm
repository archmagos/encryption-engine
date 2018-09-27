module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Greeter exposing (..)
import Test exposing (..)

-- A very basic unit test to understand Elm testing syntax

suite : Test
suite =
    describe "Greeter function"
      [ test "should return a greeting with name parameter" <|
        \_ ->
          "Fred"
            |> greeter
            |> Expect.equal "Hello Fred"
      ]
