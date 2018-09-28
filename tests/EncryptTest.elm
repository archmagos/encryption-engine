module EncryptTest exposing (encrypt, geteven, getodd)

import Encrypt exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)



getodd : Test
getodd =
    describe "getOddChars"
        [ test "should return odd indexed chars in a List" <|
            \_ ->
                getOddChars [ "A", "B", "C" ]
                    |> Expect.equal [ "B" ]
        ]



geteven : Test
geteven =
    describe "getEvenChars"
        [ test "should return even indexed chars in a List" <|
            \_ ->
                getEvenChars [ "A", "B", "C" ]
                    |> Expect.equal [ "A", "C" ]
        ]



encrypt : Test
encrypt =
    describe "encryptString"
        [ test "should return an accurate scramble" <|
            \_ ->
                encryptString 1 "This is a test!"
                    |> Expect.equal "hsi  etTi sats!"
        , test "can be called n number of times" <|
            \_ ->
                encryptString 2 "This is a test!"
                    |> Expect.equal "s eT ashi tist!"
        ]
