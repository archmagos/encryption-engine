module Encrypt exposing (Model, Msg(..), encryptString, getEvenChars, getOddChars, init, main, scrambleChars, update, view)

import Browser
import Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



{- MODEL
   'content' and 'num' store user form input.
   'decrypted' stores final decrypted string.
-}


type alias Model =
    { encrypted : String
    , content : String
    , num : Int
    }


init : Model
init =
    { encrypted = ""
    , content = ""
    , num = 0
    }



{- UPDATE
   TextInput update sets model content to user string input.
   NumInput converts user input to an Integer and sets model num to this value.
   Change calls the decryptString function, passing in model content & num.
-}


type Msg
    = Change
    | TextInput String
    | NumInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change ->
            { model | encrypted = encryptString model.num model.content }

        TextInput newContent ->
            { model | content = newContent }

        NumInput newContent ->
            { model | num = Maybe.withDefault 0 (String.toInt newContent) }



{- Splits String into List, scrambles order and reassembles as a new String.
   Recursion allows encrypton to be called n number of times.
-}


encryptString : Int -> String -> String
encryptString n string =
    if n < 1 || String.isEmpty string then
        string

    else
        string
            |> String.split ""
            |> scrambleChars
            |> String.concat
            |> encryptString (n - 1)



-- Combines two Lists comprising odd and even chars from original String.


scrambleChars : List list -> List list
scrambleChars list =
    List.append (getOddChars list) (getEvenChars list)



-- Returns a List of odd indexed chars taken from original String.


getOddChars : List list -> List list
getOddChars list =
    list
        |> List.indexedMap
            (\index value ->
                if isOdd index then
                    Just value

                else
                    Nothing
            )
        |> List.filterMap identity



-- Returns a List of even indexed chars taken from original String.


getEvenChars : List list -> List list
getEvenChars list =
    list
        |> List.indexedMap
            (\index value ->
                if isOdd index == False then
                    Just value

                else
                    Nothing
            )
        |> List.filterMap identity



{- VIEW
   Very basic view, rendering a form with two inputs and a button.
   Decrypted text is rendered with styling to ensure whitespace is preserved.
-}


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "Encrypt Text" ]
        , input [ placeholder "Text to encrypt", onInput TextInput ] []
        , input [ placeholder "Num of times", onInput NumInput ] []
        , button [ onClick Change ] [ text "Encrypt" ]
        , p [ style "white-space" "pre" ] [ text model.encrypted ]
        ]
