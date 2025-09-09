module ValentinesDay exposing (Activity(..), Approval(..), Movie(..), Restaurant(..), rateActivity)


type Approval
    = Yes
    | No
    | Maybe


type Activity
    = BoardGame
    | Chill
    | Movie Movie
    | Restaurant Restaurant


type Movie
    = Crime
    | Horror
    | Romance
    | Thriller


type Restaurant
    = Korean
    | Turkish


rateActivity : Activity -> Approval
rateActivity activity =
    case activity of
        BoardGame ->
            No

        Chill ->
            No

        Movie Crime ->
            No

        Movie Horror ->
            No

        Movie Romance ->
            Yes

        Movie Thriller ->
            No

        Restaurant Korean ->
            Yes

        Restaurant Turkish ->
            Maybe
