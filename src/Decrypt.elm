module Decrypt exposing (Model, Msg(..), assembleChars, decryptString, getFirstHalf, getSecondHalf, halveLength, init, main, update, view)

import Browser
import Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { decrypted : String
    , content : String
    , num : Int
    }


init : Model
init =
    { decrypted = ""
    , content = ""
    , num = 0
    }



-- UPDATE


type Msg
    = Change
    | TextInput String
    | NumInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change ->
            { model | decrypted = decryptString model.num model.content }

        TextInput newContent ->
            { model | content = newContent }

        NumInput newContent ->
            { model | num = Maybe.withDefault 0 (String.toInt newContent) }



{- Function splits string into halves and reassembles in correct order.
   Recursion allows decryption to be called n number of times.
-}


decryptString : Int -> String -> String
decryptString n string =
    if n < 1 || String.isEmpty string then
        string

    else
        assembleChars (getSecondHalf string) (getFirstHalf string)
            |> String.concat
            |> decryptString (n - 1)



{- Combines chars from seperate Lists into single List.
   Recursion allows for alternating between chars from each List in assembly.
-}


assembleChars : List String -> List String -> List String
assembleChars listOne listTwo =
    case listOne of
        x :: list ->
            x :: assembleChars listTwo list

        _ ->
            []



-- Returns a List containing chars from the first half of String.


getFirstHalf : String -> List String
getFirstHalf string =
    String.left (halveLength string) string
        |> String.split ""



-- Returns a List containing chars from the second half of String.


getSecondHalf : String -> List String
getSecondHalf string =
    String.split "" <|
        if isOdd (String.length string) then
            String.right (halveLength string + 1) string

        else
            String.right (halveLength string) string



-- Halves length of string rounding down, for splitting strings.


halveLength : String -> Int
halveLength string =
    String.length string // 2



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Text to decrypt", onInput TextInput ] []
        , input [ placeholder "Num of times", onInput NumInput ] []
        , button [ onClick Change ] [ text "Decrypt" ]
        , text model.decrypted
        ]
