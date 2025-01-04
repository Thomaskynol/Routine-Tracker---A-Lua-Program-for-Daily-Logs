local function printTable(table)
    print("printedTable = {")
    for key, value in pairs(table) do
        print("    " .. key .. " = {")
        for k, v in pairs(value) do
            print("        " .. k .. " = " .. tostring(v) .. ",")
        end
        print("    },")
    end
    print("}")
end


local f = io.open([[.\..\data\2025\Jan\dia-01.json]], 'r')
if f then
    print("aqui")
    f:close()
else
    print("aqui não")
end

--[[


local key, value = next(defaultValues.defaultDayEvaluation.values, nil) -- Pega o primeiro par
while key do
    print(key, value)                                            -- Imprime a chave e o valor
    key, value = next(defaultValues.defaultDayEvaluation.values, key)   -- Pega o próximo par
end
]]
--[[
valores fixos:
    são valores que não tem como mudar, por exemplo treinou hoje,
    é um valor fixo, não tem outros tipos de respota alem de sim ou não

valores semiFixos:
    valores que podem variar, mas dentro de um limite, por exemplo horas trabalhadas,
    não tem como eu trabalhar mais de 24 horas por dia

valoresVolateis:
    valores que podem varia sem um limite, por exemplo, dinheiro ganho,
    é um valor que não tem um limite especifico, é ilimitado

autoValores:
    valores dados por si mesmo, ou seja, uma auto avaliação

1 - valoresFixos
2 - valoresSemiFixos
3 - valoresVolateis
4 - autoValores

-- 5000 pontos
local valoresFixos = {
    professionally = {
        attendedProfessionalEvent = 400,
        goalsAccomplished = 600
    },
    healthAndWellBeing = {
        physicalActivityDone = 437.5,
        waterIntakeSufficient = 250,
        ateWellToday = 250,
        mentallyPositiveDay = 437.5,
        bodyHarmed = -300, -- negative points
        faceCareDone = 125
    },
    leisureAndEntertainment = { -- 10% 500
        didSomethingCreative = 350,
        readAnything = 150,
        watchedShortVideos = -1000    -- negative points
    },
    relationshipsAndCommunication = { -- 20% 1000
        communicatedWithOppositeGender = 150,
        madeNewFriend = 150,
        hungOutWithFriends = 600,
        attendedShow = 100,
        wasRudeToSomeone = -500 -- negative points
    },
    routineAndCreations = {     -- 20% 1000
        wroteDreamInJournal = 350,
        createdSomethingMeaningful = 650
    }
}

--5000
local valoresSemiFixos = {
    professionally = {
        hoursWorked = 460,
        hoursStudied = 460
    },
    healthAndWellBeing = {
        hoursSlept = 1500,    -- 8 1500
        minutesMeditated = 25 -- 30 750
    },
    leisureAndEntertainment = {
        hoursPlayedGames = -200, -- 1:30
    }
}

local valoresVolateis = {
    professionally = {
        moneyEarned = 100
    },
    leisureAndEntertainment = {
        timesPlayedOsu = 0 -- 2
    }
}

local autoValores = {
    generalEvaluation = {
        dayScore = 0
    }
}

]]
