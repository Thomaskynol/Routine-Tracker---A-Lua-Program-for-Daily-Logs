-- Imports
require("luapath")
local cjson = require("cjson")

-- Objects
local dataManagement = {}
local dataFolder = ".\\..\\data"

-- Functions
function dataManagement.writeJSON(fileName, content)
    local success, encodedTable = pcall(cjson.encode, content)

    if not success then
        print("Failed to encode table from value")
        return
    end

    local file = io.open(fileName, "w")
    if file then
        file:write(encodedTable)
        file:close()
    else
        print("Failed to open JSON file " .. fileName)
    end
end

function dataManagement.readJSON(fileName)
    local file = io.open(fileName, "r")
    if file then
        local content = file:read("*a")
        file:close()

        local success, result = pcall(cjson.decode, content)
        if success then
            return result
        else
            print("Failed to decode JSON from file: " .. fileName)
            return nil
        end
    else
        print("Failed to open file: " .. fileName)
        return nil
    end
end

function dataManagement.createDayLogFile(month, day, year)
    local function convertMonthToString(monthNumber)
        local monthsNames = {
            ["01"] = "Jan",
            ["02"] = "Feb",
            ["03"] = "Mar",
            ["04"] = "Apr",
            ["05"] = "May",
            ["06"] = "Jun",
            ["07"] = "Jul",
            ["08"] = "Aug",
            ["09"] = "Sep",
            ["10"] = "Oct",
            ["11"] = "Nov",
            ["12"] = "Dec"
        }
        return monthsNames[monthNumber] or "Invalid"
    end

    local function formatToLocation()
        return dataFolder .. "\\" .. year .. "\\" .. convertMonthToString(month)
    end

    local function getFileName()
        return "dia-" .. day .. ".json"
    end

    local function ensureDirectoryExists(directory)
        local ok, err, code = os.rename(directory, directory)

        if code == 13 then
            print("No permission to write in this directory")
        elseif not ok then
            local success, createError = os.execute("mkdir " .. directory)
            if not success then
                error("Failed to create directory: " .. createError)
            end
        end
    end

    local function formatLocationWithFile(location, fileName)
        return location .. "\\" .. fileName
    end

    local function fileExists(fileName)
        local file = io.open(fileName, "r")
        if file then
            file:close()
            return true
        else
            return false
        end
    end

    local function createFile(fileName)
        local file = io.open(fileName, "w")
        if file then
            file:close()
        else
            print("Falha ao criar o arquivo \"" .. fileName .. "\".")
        end
    end

    local location = formatToLocation()
    local fileName = getFileName()

    ensureDirectoryExists(location)
    location = formatLocationWithFile(location, fileName)
    if fileExists(location) then
        return location
    end

    createFile(location)
    return location
end

function dataManagement.findDayLogFile(month, day, year)
    local function convertMonthToString(monthNumber)
        local monthsNames = {
            ["01"] = "Jan",
            ["02"] = "Feb",
            ["03"] = "Mar",
            ["04"] = "Apr",
            ["05"] = "May",
            ["06"] = "Jun",
            ["07"] = "Jul",
            ["08"] = "Aug",
            ["09"] = "Sep",
            ["10"] = "Oct",
            ["11"] = "Nov",
            ["12"] = "Dec",
            [1] = "Jan",
            [2] = "Feb",
            [3] = "Mar",
            [4] = "Apr",
            [5] = "May",
            [6] = "Jun",
            [7] = "Jul",
            [8] = "Aug",
            [9] = "Sep",
            [10] = "Oct",
            [11] = "Nov",
            [12] = "Dec",
        }
        return monthsNames[tonumber(monthNumber)] or "Invalid"
    end

    local function formatToLocation()
        return dataFolder .. "\\" .. year .. "\\" .. convertMonthToString(month)
    end

    local function getFileName()
        local days = {
            [1] = "01",
            [2] = "02",
            [3] = "03",
            [4] = "04",
            [5] = "05",
            [6] = "06",
            [7] = "07",
            [8] = "08",
            [9] = "09",
        }
        if tonumber(day) < 9 then
            return "dia-" .. days[tonumber(day)] .. ".json"
        end
        return "dia-" .. day .. ".json"
    end

    local function directoryExists(directory)
        local ok, err, code = os.rename(directory, directory)

        if ok then
            return true
        elseif code == 13 then
            print("No permission to write in this directory")
            return true
        elseif not ok then
            return false
        end
    end

    local function formatLocationWithFile(location, fileName)
        return location .. "\\" .. fileName
    end

    local function fileExists(fileName)
        local file = io.open(fileName, "r")
        if file then
            file:close()
            return true
        else
            return false
        end
    end

    local location = formatToLocation()
    local fileName = getFileName()
    local directoryExist = directoryExists(location)
    if not directoryExist then
        return nil
    end
    location = formatLocationWithFile(location, fileName)
    if not fileExists(location) then
        return nil
    end
    return location
end

--------------------
return dataManagement
