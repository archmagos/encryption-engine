module EncryptTest exposing (..)

import Encrypt exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
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

-- Test to check that odd chars are returned as a List

getodd : Test
getodd =
    describe "getOddChars"
      [ test "should return list" <|
        \_ ->
          getOddChars ["A","B","C"]
            |> Expect.equal ["B"]
      ]

-- Test to check that even chars are returned as a List

geteven : Test
geteven =
    describe "getEvenChars"
      [ test "should return list" <|
        \_ ->
          getEvenChars ["A","B","C"]
            |> Expect.equal ["A","C"]
        ]

-- Tests that encryptString function produces accurate scramble

encrypt : Test
encrypt =
    describe "encryptString"
      [ test "should return a string" <|
        \_ ->
          encryptString "This is a test!"
            |> Expect.equal "hsi  etTi sats!"
      ]
