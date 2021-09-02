module Page.Apple exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Head
import Head.Seo as Seo
import Html as H
import Html.Attributes as HA
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Shared
import View exposing (View)


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    {}


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


type alias Data =
    ()


data : DataSource Data
data =
    DataSource.succeed ()


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "TODO"
        , locale = Nothing
        , title = "TODO title" -- metadata.title -- TODO
        }
        |> Seo.website


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view _ _ _ =
    { title = "Apple"
    , body =
        [ H.h1 [] [ H.text "Apple" ]
        , H.div [ HA.class "article" ]
            [ H.div []
                [ H.p []
                    [ H.em [] [ H.text "From Wikipedia, the free encyclopedia" ] ]
                , H.p []
                    [ H.text "An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. Apples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists. Apples have religious and mythological significance in many cultures, including Norse, Greek, and European Christian tradition." ]
                ]
            , H.figure []
                [ H.img
                    [ HA.src "https://upload.wikimedia.org/wikipedia/commons/a/a6/Pink_lady_and_cross_section.jpg"
                    , HA.alt ""
                    ]
                    []
                , H.figcaption []
                    [ H.text "Pink Lady apple and its cross section isolated on a white background" ]
                ]
            ]
        ]
    }
