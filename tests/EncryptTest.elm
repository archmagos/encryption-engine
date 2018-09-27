module EncryptTest exposing (..)

import Encrypt exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

suite : Test
suite =
    describe "Concat"
      [ test "should return two strings combined" <|
        \_ ->
          concatStrings "Apple" "Juice"
            |> Expect.equal "AppleJuice"
      ]
