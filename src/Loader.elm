module Loader exposing (Options, Style(..), defaultOptions, loader, loaderWithOptions)

{-| This library allow to show different SVG loaders.

Source: <https://codepen.io/aurer/pen/jEGbA>


# Definition

@docs Style, Options, defaultOptions


# Loader

@docs loader, loaderWithOptions

-}

import Color exposing (Color)
import Html exposing (Html)
import Svg exposing (Attribute, Svg)
import Svg.Attributes


{-| Different loader styles
-}
type Style
    = Style1
    | Style2
    | Style3
    | Style4
    | Style5
    | Style6
    | Style7
    | Style8


{-| Options to customize the loader
-}
type alias Options =
    { scale : Float
    , color : Color
    , style : Style
    }


{-| Default options
-}
defaultOptions : Options
defaultOptions =
    { scale = 1
    , color = Color.rgb 255 103 0
    , style = Style8
    }


{-| Include a loader with default options
-}
loader : Html msg
loader =
    loaderWithOptions defaultOptions


{-| Include a loader with passed options
-}
loaderWithOptions : Options -> Html msg
loaderWithOptions options =
    let
        ( width, height, viewBox, styles ) =
            case options.style of
                Style1 ->
                    style1 options.color

                Style2 ->
                    style2 options.color

                Style3 ->
                    style3 options.color

                Style4 ->
                    style4 options.color

                Style5 ->
                    style5 options.color

                Style6 ->
                    style6 options.color

                Style7 ->
                    style7 options.color

                Style8 ->
                    style8 options.color
    in
    Svg.svg (attributes options.scale width height viewBox) styles


attributes : Float -> Int -> Int -> String -> List (Attribute msg)
attributes scale width height viewBox =
    [ Svg.Attributes.version "1.1"
    , Svg.Attributes.width <| toString <| round <| scale * toFloat width
    , Svg.Attributes.height <| toString <| round <| scale * toFloat height
    , Svg.Attributes.viewBox viewBox
    ]


colorToRgbString : Color -> String
colorToRgbString color =
    let
        { red, green, blue, alpha } =
            Color.toRgb color
    in
    "rgba(" ++ toString red ++ "," ++ toString green ++ "," ++ toString blue ++ "," ++ toString alpha ++ ")"


style1 : Color -> ( Int, Int, String, List (Svg msg) )
style1 color =
    let
        colorString =
            colorToRgbString color
    in
    ( 40
    , 40
    , "0 0 40 40"
    , [ Svg.path
            [ Svg.Attributes.opacity "0.2"
            , Svg.Attributes.fill colorString
            , Svg.Attributes.d "M20.201,5.169c-8.254,0-14.946,6.692-14.946,14.946c0,8.255,6.692,14.946,14.946,14.946 s14.946-6.691,14.946-14.946C35.146,11.861,28.455,5.169,20.201,5.169z M20.201,31.749c-6.425,0-11.634-5.208-11.634-11.634 c0-6.425,5.209-11.634,11.634-11.634c6.425,0,11.633,5.209,11.633,11.634C31.834,26.541,26.626,31.749,20.201,31.749z"
            ]
            []
      , Svg.path
            [ Svg.Attributes.fill colorString
            , Svg.Attributes.d "M26.013,10.047l1.654-2.866c-2.198-1.272-4.743-2.012-7.466-2.012h0v3.312h0 C22.32,8.481,24.301,9.057,26.013,10.047z"
            ]
            [ Svg.animateTransform
                [ Svg.Attributes.attributeName "transform"
                , Svg.Attributes.type_ "rotate"
                , Svg.Attributes.from "0 20 20"
                , Svg.Attributes.to "360 20 20"
                , Svg.Attributes.dur "0.5s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      ]
    )


style2 : Color -> ( Int, Int, String, List (Svg msg) )
style2 color =
    let
        colorString =
            colorToRgbString color
    in
    ( 40
    , 40
    , "0 0 50 50"
    , [ Svg.path
            [ Svg.Attributes.fill colorString
            , Svg.Attributes.d "M25.251,6.461c-10.318,0-18.683,8.365-18.683,18.683h4.068c0-8.071,6.543-14.615,14.615-14.615V6.461z"
            ]
            [ Svg.animateTransform
                [ Svg.Attributes.attributeName "transform"
                , Svg.Attributes.type_ "rotate"
                , Svg.Attributes.from "0 25 25"
                , Svg.Attributes.to "360 25 25"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      ]
    )


style3 : Color -> ( Int, Int, String, List (Svg msg) )
style3 color =
    let
        colorString =
            colorToRgbString color
    in
    ( 40
    , 40
    , "0 0 50 50"
    , [ Svg.path
            [ Svg.Attributes.fill colorString
            , Svg.Attributes.d "M43.935,25.145c0-10.318-8.364-18.683-18.683-18.683c-10.318,0-18.683,8.365-18.683,18.683h4.068c0-8.071,6.543-14.615,14.615-14.615c8.072,0,14.615,6.543,14.615,14.615H43.935z"
            ]
            [ Svg.animateTransform
                [ Svg.Attributes.attributeName "transform"
                , Svg.Attributes.type_ "rotate"
                , Svg.Attributes.from "0 25 25"
                , Svg.Attributes.to "360 25 25"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      ]
    )


style4 : Color -> ( Int, Int, String, List (Svg msg) )
style4 color =
    let
        colorString =
            colorToRgbString color
    in
    ( 24
    , 24
    , "0 0 24 24"
    , [ Svg.rect
            [ Svg.Attributes.x "0"
            , Svg.Attributes.y "0"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "7"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animateTransform
                [ Svg.Attributes.attributeName "transform"
                , Svg.Attributes.type_ "scale"
                , Svg.Attributes.values "1,1; 1,3; 1,1"
                , Svg.Attributes.begin "0s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      , Svg.rect
            [ Svg.Attributes.x "10"
            , Svg.Attributes.y "0"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "7"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animateTransform
                [ Svg.Attributes.attributeName "transform"
                , Svg.Attributes.type_ "scale"
                , Svg.Attributes.values "1,1; 1,3; 1,1"
                , Svg.Attributes.begin "0.2s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      , Svg.rect
            [ Svg.Attributes.x "20"
            , Svg.Attributes.y "0"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "7"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animateTransform
                [ Svg.Attributes.attributeName "transform"
                , Svg.Attributes.type_ "scale"
                , Svg.Attributes.values "1,1; 1,3; 1,1"
                , Svg.Attributes.begin "0.4s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      ]
    )


style5 : Color -> ( Int, Int, String, List (Svg msg) )
style5 color =
    let
        colorString =
            colorToRgbString color
    in
    ( 24
    , 30
    , "0 0 24 30"
    , [ Svg.rect
            [ Svg.Attributes.x "0"
            , Svg.Attributes.y "0"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "10"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animateTransform
                [ Svg.Attributes.attributeName "transform"
                , Svg.Attributes.type_ "translate"
                , Svg.Attributes.values "0 0; 0 20; 0 0"
                , Svg.Attributes.begin "0s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      , Svg.rect
            [ Svg.Attributes.x "10"
            , Svg.Attributes.y "0"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "10"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animateTransform
                [ Svg.Attributes.attributeName "transform"
                , Svg.Attributes.type_ "translate"
                , Svg.Attributes.values "0 0; 0 20; 0 0"
                , Svg.Attributes.begin "0.2s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      , Svg.rect
            [ Svg.Attributes.x "20"
            , Svg.Attributes.y "0"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "10"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animateTransform
                [ Svg.Attributes.attributeName "transform"
                , Svg.Attributes.type_ "translate"
                , Svg.Attributes.values "0 0; 0 20; 0 0"
                , Svg.Attributes.begin "0.4s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      ]
    )


style6 : Color -> ( Int, Int, String, List (Svg msg) )
style6 color =
    let
        colorString =
            colorToRgbString color
    in
    ( 24
    , 30
    , "0 0 24 30"
    , [ Svg.rect
            [ Svg.Attributes.x "0"
            , Svg.Attributes.y "13"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "5"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animate
                [ Svg.Attributes.attributeName "height"
                , Svg.Attributes.values "5; 21; 5"
                , Svg.Attributes.begin "0s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            , Svg.animate
                [ Svg.Attributes.attributeName "y"
                , Svg.Attributes.values "13; 5; 13"
                , Svg.Attributes.begin "0s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      , Svg.rect
            [ Svg.Attributes.x "10"
            , Svg.Attributes.y "13"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "5"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animate
                [ Svg.Attributes.attributeName "height"
                , Svg.Attributes.values "5; 21; 5"
                , Svg.Attributes.begin "0.15s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            , Svg.animate
                [ Svg.Attributes.attributeName "y"
                , Svg.Attributes.values "13; 5; 13"
                , Svg.Attributes.begin "0.15s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      , Svg.rect
            [ Svg.Attributes.x "20"
            , Svg.Attributes.y "13"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "5"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animate
                [ Svg.Attributes.attributeName "height"
                , Svg.Attributes.values "5; 21; 5"
                , Svg.Attributes.begin "0.3s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            , Svg.animate
                [ Svg.Attributes.attributeName "y"
                , Svg.Attributes.values "13; 5; 13"
                , Svg.Attributes.begin "0.3s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      ]
    )


style7 : Color -> ( Int, Int, String, List (Svg msg) )
style7 color =
    let
        colorString =
            colorToRgbString color
    in
    ( 18
    , 20
    , "0 0 18 20"
    , [ Svg.rect
            [ Svg.Attributes.x "0"
            , Svg.Attributes.y "0"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "20"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animate
                [ Svg.Attributes.attributeName "opacity"
                , Svg.Attributes.values "1; .2; 1"
                , Svg.Attributes.begin "0s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      , Svg.rect
            [ Svg.Attributes.x "7"
            , Svg.Attributes.y "0"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "20"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animate
                [ Svg.Attributes.attributeName "opacity"
                , Svg.Attributes.values "1; .2; 1"
                , Svg.Attributes.begin "0.2s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      , Svg.rect
            [ Svg.Attributes.x "14"
            , Svg.Attributes.y "0"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "20"
            , Svg.Attributes.fill colorString
            ]
            [ Svg.animate
                [ Svg.Attributes.attributeName "opacity"
                , Svg.Attributes.values "1; .2; 1"
                , Svg.Attributes.begin "0.4s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      ]
    )


style8 : Color -> ( Int, Int, String, List (Svg msg) )
style8 color =
    let
        colorString =
            colorToRgbString color
    in
    ( 20
    , 30
    , "0 0 20 30"
    , [ Svg.rect
            [ Svg.Attributes.x "0"
            , Svg.Attributes.y "10"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "10"
            , Svg.Attributes.fill colorString
            , Svg.Attributes.opacity "0.2"
            ]
            [ Svg.animate
                [ Svg.Attributes.attributeName "opacity"
                , Svg.Attributes.values "0.2; 1; .2"
                , Svg.Attributes.begin "0s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            , Svg.animate
                [ Svg.Attributes.attributeName "height"
                , Svg.Attributes.values "10; 20; 10"
                , Svg.Attributes.begin "0s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            , Svg.animate
                [ Svg.Attributes.attributeName "y"
                , Svg.Attributes.values "10; 5; 10"
                , Svg.Attributes.begin "0s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      , Svg.rect
            [ Svg.Attributes.x "8"
            , Svg.Attributes.y "10"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "10"
            , Svg.Attributes.fill colorString
            , Svg.Attributes.opacity "0.2"
            ]
            [ Svg.animate
                [ Svg.Attributes.attributeName "opacity"
                , Svg.Attributes.values "0.2; 1; .2"
                , Svg.Attributes.begin "0.15s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            , Svg.animate
                [ Svg.Attributes.attributeName "height"
                , Svg.Attributes.values "10; 20; 10"
                , Svg.Attributes.begin "0.15s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            , Svg.animate
                [ Svg.Attributes.attributeName "y"
                , Svg.Attributes.values "10; 5; 10"
                , Svg.Attributes.begin "0.15s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      , Svg.rect
            [ Svg.Attributes.x "16"
            , Svg.Attributes.y "10"
            , Svg.Attributes.width "4"
            , Svg.Attributes.height "10"
            , Svg.Attributes.fill colorString
            , Svg.Attributes.opacity "0.2"
            ]
            [ Svg.animate
                [ Svg.Attributes.attributeName "opacity"
                , Svg.Attributes.values "0.2; 1; .2"
                , Svg.Attributes.begin "0.3s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            , Svg.animate
                [ Svg.Attributes.attributeName "height"
                , Svg.Attributes.values "10; 20; 10"
                , Svg.Attributes.begin "0.3s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            , Svg.animate
                [ Svg.Attributes.attributeName "y"
                , Svg.Attributes.values "10; 5; 10"
                , Svg.Attributes.begin "0.3s"
                , Svg.Attributes.dur "0.6s"
                , Svg.Attributes.repeatCount "indefinite"
                ]
                []
            ]
      ]
    )
