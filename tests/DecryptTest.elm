module DecryptTest exposing (..)

import Decrypt exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

-- Basic test to check that function pipes and returns appropriately

encrypt : Test
encrypt =
    describe "decryptString"
      [ test "should return a string" <|
        \_ ->
          decryptString "Test"
            |> Expect.equal "Test"
      ]
