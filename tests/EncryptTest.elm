module EncryptTest exposing (..)

import Encrypt exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

-- Basic test to check that strings are split and then returned to strings

suite : Test
suite =
    describe "encryptString"
      [ test "should return a string" <|
        \_ ->
          encryptString "Apple"
            |> Expect.equal "Apple"
      ]
