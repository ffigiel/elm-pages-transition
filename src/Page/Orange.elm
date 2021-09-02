module Page.Orange exposing (Data, Model, Msg, page)

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
    { title = "Orange"
    , body =
        [ H.h1 [] [ H.text "Orange" ]
        , H.div [ HA.class "article" ]
            [ H.div []
                [ H.p []
                    [ H.em [] [ H.text "From Wikipedia, the free encyclopedia" ] ]
                , H.p []
                    [ H.text "The orange is the fruit of various citrus species in the family Rutaceae (see list of plants known as orange); it primarily refers to Citrus × sinensis, which is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange. The sweet orange reproduces asexually (apomixis through nucellar embryony); varieties of sweet orange arise through mutations." ]
                ]
            , H.figure []
                [ H.img
                    [ HA.src "https://upload.wikimedia.org/wikipedia/commons/e/e3/Oranges_-_whole-halved-segment.jpg"
                    , HA.alt ""
                    ]
                    []
                , H.figcaption []
                    [ H.text "Oranges – whole, halved and peeled segment" ]
                ]
            ]
        ]
    }
