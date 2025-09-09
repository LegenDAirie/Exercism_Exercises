module ValentinesDay exposing (Activity(..), Approval(..), Movie(..), Restaurant(..), rateActivity)


type Approval
    = Yes
    | No
    | Maybe


type Activity
    = BoardGame
    | Chill
    | Movie Genre
    | Restaurant Cuisine


type Genre
    = Crime
    | Horror
    | Romance
    | Thriller


type Cuisine
    = Korean
    | Turkish


rateActivity : Activity -> Approval
rateActivity activity =
    case activity of
        BoardGame ->
            No

        Chill ->
            No

        Movie Romance ->
            Yes

        Movie _ ->
            No

        Restaurant Korean ->
            Yes

        Restaurant Turkish ->
            Maybe
