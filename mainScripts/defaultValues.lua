-- Objects
local defaultValues = {}

-- Values
defaultValues.correctOrderForDayEvaluation = {
    firstLayer = {
        "professionally",
        "healthAndWellBeing",
        "leisureAndEntertainment",
        "relationshipsAndCommunication",
        "routineAndCreations",
        "generalEvaluation",
    },
    secondLayers = {
        professionally = {
            "hoursWorked",
            "hoursStudied",
            "attendedProfessionalEvent",
            "goalsAccomplished",
            "moneyEarned",
        },
        healthAndWellBeing = {
            "hoursSlept",
            "gotUpEarly",
            "physicalActivityDone",
            "waterIntakeSufficient",
            "ateWellToday",
            "faceCareDone",
            "bodyHarmed",
            "minutesMeditated",
            "mentallyPositiveDay",
        },
        leisureAndEntertainment = {
            "didSomethingCreative",
            "readAnything",
            "hoursPlayedGames",
            "watchedShortVideos",
            "timesPlayedOsu",
        },
        relationshipsAndCommunication = {
            "communicatedWithOppositeGender",
            "madeNewFriend",
            "hungOutWithFriends",
            "attendedShow",
            "wasRudeToSomeone",
        },
        routineAndCreations = {
            "wroteDreamInJournal",
            "createdSomethingMeaningful",
            "meaningfulCreationDescription",
        },
        generalEvaluation = {
            "dayScore",
            "dayNote",
        },
    }
}

defaultValues.defaultScoreValue = {
    professionally = {
        hoursWorked = 460,
        hoursStudied = 460,
        attendedProfessionalEvent = 400,
        goalsAccomplished = 600,
        moneyEarned = 100,
    },
    healthAndWellBeing = {
        hoursSlept = 1000,
        gotUpEarly = 500,
        physicalActivityDone = 437.5,
        waterIntakeSufficient = 250,
        ateWellToday = 250,
        faceCareDone = 125,
        bodyHarmed = -300,
        minutesMeditated = 25,
        mentallyPositiveDay = 437.5,
    },
    leisureAndEntertainment = {
        didSomethingCreative = 350,
        readAnything = 150,
        hoursPlayedGames = -500,
        watchedShortVideos = -1000,
        timesPlayedOsu = 0
    },
    relationshipsAndCommunication = {
        communicatedWithOppositeGender = 150,
        madeNewFriend = 150,
        hungOutWithFriends = 600,
        attendedShow = 100,
        wasRudeToSomeone = -500
    },
    routineAndCreations = {
        wroteDreamInJournal = 350,
        createdSomethingMeaningful = 650,
        meaningfulCreationDescription = 0
    },
    generalEvaluation = {
        dayScore = 0,
        dayNote = 0,
    }
}

defaultValues.defaultDayEvaluation = {
    questions = {
        professionally = {
            hoursWorked = "How many hours did you work today?",
            hoursStudied = "How many hours did you dedicate to studying?",
            attendedProfessionalEvent = "Did you participate in any meetings or professional events today?",
            goalsAccomplished = "Were you able to achieve all the goals you set for today?",
            moneyEarned = "What was your total income for the day?",
        },
        healthAndWellBeing = {
            hoursSlept = "How many hours of sleep did you get last night?",
            gotUpEarly = "Did you wake up early today?",
            physicalActivityDone = "Did you engage in any physical exercise today?",
            waterIntakeSufficient = "Do you feel like you drank enough water today?",
            ateWellToday = "Would you say your meals were healthy and balanced today?",
            faceCareDone = "Did you spend time caring for your face or skin today?",
            bodyHarmed = "Did you do anything that could have harmed your body today?",
            minutesMeditated = "How much time (in minutes) did you spend meditating today?",
            mentallyPositiveDay = "Overall, was your day mentally positive and uplifting?",
        },
        leisureAndEntertainment = {
            didSomethingCreative = "Did you engage in any creative activities today?",
            readAnything = "Did you read something interesting today (like a book, article, or story)?",
            hoursPlayedGames = "How many hours did you spend playing games today?",
            watchedShortVideos = "Did you watch any short videos or reels today?",
            timesPlayedOsu = "How many sessions of osu! did you play today?"
        },
        relationshipsAndCommunication = {
            communicatedWithOppositeGender =
            "Did you have a meaningful conversation with someone of the opposite gender today?",
            madeNewFriend = "Did you make any new friends today?",
            hungOutWithFriends = "Did you hang out or spend time with your friends today?",
            attendedShow = "Did you attend any live events or shows today?",
            wasRudeToSomeone = "Were you rude or unkind to anyone today?"
        },
        routineAndCreations = {
            wroteDreamInJournal = "Did you write down any dreams or thoughts in your journal today?",
            createdSomethingMeaningful = "Did you work on or create something meaningful today?",
            meaningfulCreationDescription = "can you describe what you created?"
        },
        generalEvaluation = {
            dayScore = "On a scale of 0 to 100, how would you rate your day overall?",
            dayNotes = "Would you like to reflect or jot down any thoughts about your day?",
        }
    },
    values = {
        professionally = {
            hoursWorked = 0,
            hoursStudied = 0,
            attendedProfessionalEvent = false,
            goalsAccomplished = false,
            moneyEarned = 0,
        },
        healthAndWellBeing = {
            hoursSlept = 0,
            gotUpEarly = false,
            physicalActivityDone = false,
            waterIntakeSufficient = false,
            ateWellToday = false,
            faceCareDone = false,
            bodyHarmed = false,
            minutesMeditated = 0,
            mentallyPositiveDay = false,
        },
        leisureAndEntertainment = {
            didSomethingCreative = false,
            readAnything = false,
            hoursPlayedGames = 0,
            watchedShortVideos = false,
            timesPlayedOsu = 0
        },
        relationshipsAndCommunication = {
            communicatedWithOppositeGender = false,
            madeNewFriend = false,
            hungOutWithFriends = false,
            attendedShow = false,
            wasRudeToSomeone = false
        },
        routineAndCreations = {
            wroteDreamInJournal = false,
            createdSomethingMeaningful = false,
            meaningfulCreationDescription = ""
        },
        generalEvaluation = {
            dayScore = 0,
            dayNotes = "",
        }
    },
}

defaultValues.defaultConfig = {
    questions = {
        daily = {
            allowedGameHours = "How many hours of gaming do you want to allow per day?", -- in hours
            idealSleepTime = "What is your ideal sleep time in hours?",                  -- in hours
        }
    },
}

--------------
return defaultValues
