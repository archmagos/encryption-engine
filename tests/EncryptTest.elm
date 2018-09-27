module EncryptTest exposing (..)

import Encrypt exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

suite : Test
suite =
    describe "encryptString"
      [ test "should split string into a List" <|
        \_ ->
          encryptString "Apple"
            |> Expect.equal ["A","p","p","l","e"]
      ]
