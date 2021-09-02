module Shared exposing (Data, Model, Msg(..), SharedMsg(..), template)

import Browser.Navigation
import DataSource
import Html as H exposing (Html)
import Html.Attributes as HA
import Html.Keyed as HK
import Pages.Flags
import Pages.PageUrl exposing (PageUrl)
import Path exposing (Path)
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import View exposing (View)


template : SharedTemplate Msg Model Data msg
template =
    { init = init
    , update = update
    , view = view
    , data = data
    , subscriptions = subscriptions
    , onPageChange = Just OnPageChange
    }


type Msg
    = OnPageChange
        { path : Path
        , query : Maybe String
        , fragment : Maybe String
        }
    | SharedMsg SharedMsg


type alias Data =
    ()


type SharedMsg
    = NoOp


type alias Model =
    { showMobileMenu : Bool
    }


init :
    Maybe Browser.Navigation.Key
    -> Pages.Flags.Flags
    ->
        Maybe
            { path :
                { path : Path
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Cmd Msg )
init _ _ _ =
    ( { showMobileMenu = False }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnPageChange _ ->
            ( { model | showMobileMenu = False }, Cmd.none )

        SharedMsg _ ->
            ( model, Cmd.none )


subscriptions : Path -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


data : DataSource.DataSource Data
data =
    DataSource.succeed ()


view :
    Data
    ->
        { path : Path
        , route : Maybe Route
        }
    -> Model
    -> (Msg -> msg)
    -> View msg
    -> { body : Html msg, title : String }
view _ page _ _ pageView =
    let
        -- generate an id for Html.Keyed that changes during navigation
        pageId =
            page.route
                |> Maybe.map routeName
                |> Maybe.withDefault ""
    in
    { title = pageView.title
    , body =
        H.div []
            [ nav page.route
            , HK.node "div"
                []
                [ ( pageId
                  , H.div
                        [ HA.classList
                            [ ( "pageBody", True )

                            -- TODO: before switching pages, set this to True and sleep for 500ms
                            , ( "-leaving", False )
                            ]
                        ]
                        pageView.body
                  )
                ]
            ]
    }


nav : Maybe Route -> Html msg
nav currentRoute =
    let
        navItems =
            [ Route.Index
            , Route.Apple
            , Route.Orange
            ]

        viewNavItem route =
            Route.link route
                [ HA.classList
                    [ ( "navItem", True )
                    , ( "-active", currentRoute == Just route )
                    ]
                ]
                [ H.text (routeName route) ]
    in
    H.nav []
        (List.map viewNavItem navItems)


routeName : Route -> String
routeName route =
    case route of
        Route.Index ->
            "Home"

        Route.Apple ->
            "Apple"

        Route.Orange ->
            "Orange"
