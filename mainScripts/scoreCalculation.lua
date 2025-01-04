-- Imports
local defaultValues = require("defaultValues")
local config = require("config")

-- Objects
local scoreCalculation = {}

-- Functions
function scoreCalculation.printScore(scoreTable)
    print("Score:")
    local totalScore = 0
    for _, key in ipairs(defaultValues.correctOrderForDayEvaluation.firstLayer) do
        local value = scoreTable[key]
        totalScore = totalScore + value
        print("    " .. key .. ": " .. tostring(value))
    end
    print("Total Score: " .. totalScore)
end

function scoreCalculation.calculateDayScore(dayEvaluation)
    if not dayEvaluation or type(dayEvaluation) ~= "table" then
        error("Invalid dayEvaluation input")
    end

    local score = {
        professionally = 0,
        healthAndWellBeing = 0,
        leisureAndEntertainment = 0,
        relationshipsAndCommunication = 0,
        routineAndCreations = 0,
        generalEvaluation = 0,
    }

    for key, value in pairs(dayEvaluation.professionally) do
        local scoreValue = defaultValues.defaultScoreValue.professionally[key]
        if type(value) == "number" then
            score.professionally = score.professionally + (value * scoreValue)
        elseif type(value) == "boolean" then
            if value then
                score.professionally = score.professionally + scoreValue
            end
        end
    end

    for key, value in pairs(dayEvaluation.healthAndWellBeing) do
        local scoreValue = defaultValues.defaultScoreValue.healthAndWellBeing[key]

        if key == "hoursSlept" then
            if value >= config.limits.hoursSlept - 1 and value <= config.limits.hoursSlept + 1 then
                score.healthAndWellBeing = score.healthAndWellBeing + scoreValue
            end
        elseif type(value) == "number" then
            score.healthAndWellBeing = score.healthAndWellBeing + (value * scoreValue)
        elseif type(value) == "boolean" then
            if value then
                score.healthAndWellBeing = score.healthAndWellBeing + scoreValue
            end
        end
    end

    for key, value in pairs(dayEvaluation.leisureAndEntertainment) do
        local scoreValue = defaultValues.defaultScoreValue.leisureAndEntertainment[key]

        if key == "hoursPlayedGames" then
            if value > config.limits.hoursPlayedGames then
                score.leisureAndEntertainment = score.leisureAndEntertainment + scoreValue
            end
        elseif type(value) == "number" then
            score.leisureAndEntertainment = score.leisureAndEntertainment + (value * scoreValue)
        elseif type(value) == "boolean" then
            if value then
                score.leisureAndEntertainment = score.leisureAndEntertainment + scoreValue
            end
        end
    end

    for key, value in pairs(dayEvaluation.relationshipsAndCommunication) do
        local scoreValue = defaultValues.defaultScoreValue.relationshipsAndCommunication[key]
        if value then
            score.relationshipsAndCommunication = score.relationshipsAndCommunication + scoreValue
        end
    end

    for key, value in pairs(dayEvaluation.routineAndCreations) do
        local scoreValue = defaultValues.defaultScoreValue.routineAndCreations[key]
        if type(value) == "boolean" then
            if value then
                score.routineAndCreations = score.routineAndCreations + scoreValue
            end
        end
    end

    local dayScoreModificationPercent = ((dayEvaluation.generalEvaluation.dayScore - 50) / 1000)
    local totalScore = 0
    for key, value in pairs(score) do
        totalScore = totalScore + value
    end
    score.generalEvaluation = totalScore * dayScoreModificationPercent


    for key, value in pairs(score) do
        score[key] = value * config.boostsAndNerfs[key]
    end

    return score
end

-----------------------
return scoreCalculation
