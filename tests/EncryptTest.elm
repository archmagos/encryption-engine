module EncryptTest exposing (..)

import Encrypt exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)

-- Basic test to check that strings are split and then returned to strings

encrypt : Test
encrypt =
    describe "encryptString"
      [ test "should return a string" <|
        \_ ->
          encryptString "Apple"
            |> Expect.equal "Atestpteste"
      ]

-- Basic test to check that indexed mapping interacts appropriately with isOdd function

scramble : Test
scramble =
    describe "scrambleChars"
      [ test "should return list" <|
        \_ ->
          scrambleChars ["A","B","C"]
            |> Expect.equal ["A","test","C"]
      ]

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
