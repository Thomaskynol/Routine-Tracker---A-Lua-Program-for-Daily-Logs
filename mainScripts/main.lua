-- Imports
require("luapath")
local dataManagement = require("dataManagement")
local userInteraction = require("userInteraction")
local scoreCalculation = require("scoreCalculation")
local defaultValues = require("defaultValues")

-- Main Functions
local function registerDayLog(month, day, year)
    local dateIsOnThePast = userInteraction.dateIsOnThePast(month, day, year)
    if not dateIsOnThePast then
        print("only past dates is authorized!")
        return
    end

    local dayEvaluation = userInteraction.getDayLog()
    local dayLogFile = dataManagement.createDayLogFile(month, day, year)
    dataManagement.writeJSON(dayLogFile, dayEvaluation)

    local score = scoreCalculation.calculateDayScore(dayEvaluation)
    scoreCalculation.printScore(score)
end

local function seeScore(month, day, year)
    local dayLogFile = dataManagement.findDayLogFile(month, day, year)

    if not dayLogFile then
        print("The log for the specified date does not exist...")
        --[[
        userInteraction.sleep(1)
        os.execute('cls')
        print("The log for the specified date does not exist..")
        userInteraction.sleep(1)
        os.execute('cls')
        print("The log for the specified date does not exist...")
        userInteraction.sleep(1)
        os.execute('cls')
        print("The log for the specified date does not exist..")]]
        return
    end

    local dayEvaluation = dataManagement.readJSON(dayLogFile)

    local score = scoreCalculation.calculateDayScore(dayEvaluation)
    scoreCalculation.printScore(score)
end

local options = {
    [1] = {
        name = "Register data from today",
        execute = function() -- Register day log from today
            local month, day, year = os.date("%m"), os.date("%d"), os.date("%y")
            registerDayLog(month, day, year)
            os.execute('pause')
            os.execute('cls')
        end
    },
    [2] = {
        name = "Registar day log from another day",
        execute = function() -- Register day log from another day
            local month, day, year = userInteraction.askForDate()
            os.execute('cls')
            registerDayLog(month, day, year)
            os.execute('pause')
            os.execute('cls')
        end
    },
    [3] = {
        name = "See score of a day log",
        execute = function()
            local month, day, year = userInteraction.askForDate()
            month = tostring(month)
            day = tostring(day)
            year = tostring(year)
            os.execute('cls')
            seeScore(month, day, year)
            os.execute('pause')
            os.execute('cls')
        end
    },
}

local function showOptions()
    for index, value in ipairs(options) do
        print("[" .. index .. "] = " .. value.name)
    end
end

local function mainLoop()
    while true do
        showOptions()
        local selectedOption = userInteraction.askForNumber("What option do you want?", true, #options, 1)
        os.execute('cls')
        options[selectedOption].execute()
        os.execute('cls')
    end
end

-- Main
local ok, err = pcall(mainLoop)
if not ok then
    print("encerrando programa...")
    os.exit(0)
end