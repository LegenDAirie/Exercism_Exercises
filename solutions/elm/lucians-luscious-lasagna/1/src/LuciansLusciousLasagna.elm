module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)

-- TODO: define the expectedMinutesInOven constant
expectedMinutesInOven = 40

-- TODO: define the preparationTimeInMinutes function
preparationTimeInMinutes numOfLayers = numOfLayers * 2

-- TODO: define the elapsedTimeInMinutes function
elapsedTimeInMinutes numOfLayers beenInOven = 
    beenInOven + preparationTimeInMinutes numOfLayers