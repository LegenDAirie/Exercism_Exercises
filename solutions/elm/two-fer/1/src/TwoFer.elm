module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer possibleName =
    case possibleName of
        Just name -> String.concat ["One for ", name, ", one for me."]
        Nothing -> "One for you, one for me."
