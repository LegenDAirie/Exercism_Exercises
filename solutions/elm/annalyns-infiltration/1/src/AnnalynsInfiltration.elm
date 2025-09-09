module AnnalynsInfiltration exposing (canFastAttack, canFreePrisoner, canSignalPrisoner, canSpy, stealthAttackDamage)


canFastAttack : Bool -> Bool
canFastAttack knightIsAwake =
    not knightIsAwake


canSpy : Bool -> Bool -> Bool -> Bool
canSpy knightIsAwake archerIsAwake prisonerIsAwake =
    knightIsAwake || archerIsAwake || prisonerIsAwake


canSignalPrisoner : Bool -> Bool -> Bool
canSignalPrisoner archerIsAwake prisonerIsAwake =
    prisonerIsAwake && not archerIsAwake


canFreePrisoner : Bool -> Bool -> Bool -> Bool -> Bool
canFreePrisoner knightIsAwake archerIsAwake prisonerIsAwake petDogIsPresent =
    prisonerIsAwake && canSneakPassedGuards knightIsAwake archerIsAwake petDogIsPresent


canSneakPassedGuards : Bool -> Bool -> Bool -> Bool
canSneakPassedGuards knightIsAwake archerIsAwake petDogIsPresent =
    guardsAreSleeping knightIsAwake archerIsAwake
        || dogCanHandleKnight archerIsAwake petDogIsPresent


guardsAreSleeping : Bool -> Bool -> Bool
guardsAreSleeping knightIsAwake archerIsAwake =
    not knightIsAwake && not archerIsAwake


dogCanHandleKnight : Bool -> Bool -> Bool
dogCanHandleKnight archerIsAwake petDogIsPresent =
    not archerIsAwake && petDogIsPresent


stealthAttackDamage : Bool -> Int
stealthAttackDamage annalynIsDetected =
    case annalynIsDetected of
        True ->
            7

        False ->
            12
