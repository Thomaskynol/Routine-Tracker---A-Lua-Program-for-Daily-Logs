-- Imports
local defaultValues = require("defaultValues")

-- Objects
local userInteraction = {}

-- Functions
function userInteraction.askForDate()
    local day = userInteraction.askForNumber("whats day?", true, 31, 1)
    os.execute('cls')
    local month = userInteraction.askForNumber("whats month?", true, 12, 1)
    os.execute('cls')
    --
    local year = userInteraction.askForNumber("whats year", true, tonumber(os.date("%Y")), 2010)
    os.execute('cls')
    return month, day, year
end

function userInteraction.askForNumber(question, isLimited, maxLimit, minlimit)
    isLimited = isLimited or nil

    local function limitCheck(number)
        minlimit = minlimit or 0
        if number >= minlimit and number <= maxLimit then
            return number
        end
        return nil
    end

    print(question)
    local answer = io.read()
    local numericAnswer = tonumber(answer)
    if numericAnswer and isLimited then
        numericAnswer = limitCheck(numericAnswer)
    end
    while not numericAnswer do
        print("This is not a valid number. Please try again.")
        answer = io.read()
        numericAnswer = tonumber(answer)
        if numericAnswer and isLimited then
            numericAnswer = limitCheck(numericAnswer)
        end
    end

    return numericAnswer
end

function userInteraction.askForYesOrNo(question)
    print(question .. " (y or n)")
    local answer = io.read()
    local passed = string.lower(answer) == "y" or string.lower(answer) == "n"
    while not passed do
        print("This is not a yes or no. Please try again.")
        answer = io.read()
        passed = string.lower(answer) == "y" or string.lower(answer) == "n"
    end
    return string.lower(answer) == "y"
end

function userInteraction.askForString(question)
    print(question)
    return io.read()
end

function userInteraction.getDayLog()
    local function formatCategoryTitle(categoryName)
        local titles = {
            professionally = "Professional Achievements",
            healthAndWellBeing = "Health and Well-Being",
            leisureAndEntertainment = "Leisure and Entertainment",
            relationshipsAndCommunication = "Relationships and Communication",
            routineAndCreations = "Routine and Creations",
            generalEvaluation = "General Evaluation"
        }

        return titles[categoryName] or "Unknown Category"
    end

    local DayEvaluation = defaultValues.defaultDayEvaluation.values

    for _, categoryName in ipairs(defaultValues.correctOrderForDayEvaluation.firstLayer) do
        local className = formatCategoryTitle(categoryName)

        for _, key in ipairs(defaultValues.correctOrderForDayEvaluation.secondLayers[categoryName]) do
            local value = defaultValues.defaultDayEvaluation.values[categoryName][key]

            local questionString = defaultValues.defaultDayEvaluation.questions[categoryName][key]
            local answer
            local isToAsk = true
            local limitedNumber = false

            local function ask(limited)
                limited = limited or nil
                print(className .. ":")
                if type(value) == "number" then
                    answer = userInteraction.askForNumber(questionString, limited, 100, 0)
                elseif type(value) == "boolean" then
                    answer = userInteraction.askForYesOrNo(questionString)
                elseif type(value) == "string" then
                    answer = userInteraction.askForString(questionString)
                end
            end

            if key == "meaningfulCreationDescription" then
                if not DayEvaluation.routineAndCreations.createdSomethingMeaningful then
                    isToAsk = false
                end
            elseif key == "dayScore" then
                limitedNumber = true
            end

            if isToAsk then
                ask(limitedNumber)
                os.execute("cls")
            end
            DayEvaluation[categoryName][key] = answer
        end
    end

    return DayEvaluation
end

function userInteraction.dateIsOnThePast(month, day, year)
    local currentYear = tonumber(os.date("%Y"))
    local currentMonth = tonumber(os.date("%m"))
    local currentDay = tonumber(os.date("%d"))

    if tonumber(year) < currentYear then
        return true
    elseif tonumber(year) == currentYear then
        if tonumber(month) < currentMonth then
            return true
        elseif tonumber(month) == currentMonth and tonumber(day) < currentDay then
            return true
        end
    end
    return false
end

function userInteraction.sleep(seconds)
    local start = os.clock()
    while os.clock() - start < seconds do

    end
end

----------------------
return userInteraction
