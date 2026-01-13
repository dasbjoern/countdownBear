local M = {}

local function countDownStarted(seconds)

    if seconds == "3" then
        Engine.Audio.playOnce("AudioGui", "event:UI_Countdown1")
    elseif seconds == "2" then
        Engine.Audio.playOnce("AudioGui", "event:UI_Countdown2")
    elseif seconds == "1" then
        Engine.Audio.playOnce("AudioGui", "event:UI_Countdown3")
    end

    -- Sends update to ui app.
    guihooks.trigger("countdownBearappUpdate", {seconds = seconds})
end

local function countdownStop(seconds)
    
    guihooks.trigger("countdownBearappUpdate", {seconds = seconds})
    Engine.Audio.playOnce("AudioGui", "event:UI_CountdownGo")
end

local function onExtensionLoaded()
    print("Countdown Extension loaded")

    log("I", "onExtensionLoaded", "countdownBear onExtensionLoaded")
end

local function onExtensionUnloaded()
    log("I", "countdownBear", "countdownBear UNLOADED")
end

AddEventHandler("CountdownStarted", countDownStarted)
AddEventHandler("CountdownStop", countdownStop)

M.onExtensionLoaded = onExtensionLoaded
M.onExtensionUnloaded = onExtensionUnloaded

M.onInit = function() setExtensionUnloadMode(M, "manual") end


return M
