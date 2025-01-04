-- Imports
local dataManagement = require("dataManagement")
local userInteraction = require("userInteraction")

-- Objects
local config = {}

config.limits = {
    hoursPlayedGames = 1.5,
    hoursSlept = 8,
}

config.boostsAndNerfs = { -- values in percent
    professionally = 100 / 100,
    healthAndWellBeing = 100 / 100,
    leisureAndEntertainment = 100 / 100,
    relationshipsAndCommunication = 100 / 100,
    routineAndCreations = 100 / 100,
    generalEvaluation = 100 / 100,
}

------------
return config
