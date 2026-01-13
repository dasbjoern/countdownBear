
local counter = 0


function onInit()
    MP.RegisterEvent("onChatMessage", "chatMessageHandler")
    print("Countdown plugin loaded")
end

function chatMessageHandler(player_id, player_name, message)
    local countdown = parseMessage(message)
    if countdown ~= -1 then
        counter = countdown
        MP.SendChatMessage(-1, "Countdown started.")
        MP.CreateEventTimer("CounterEvent", 1000)
        MP.RegisterEvent("CounterEvent", "countDownEvent")
    end
end

function countDownEvent()

        if counter > 0 then
            
            MP.SendChatMessage(-1, tostring(counter))
            
            -- Sending a timestamp may be implemented to synchronize clients and have them do the work
            -- May be better for larger servers, but could cause other problems. 
            -- local nextMs = os.time() * 1000 + 1000

            MP.TriggerClientEvent(-1, "CountdownStarted", tostring(counter))
            
            counter = counter -1
            

        else 
            MP.SendChatMessage(-1, "GO!")

            -- local nextMs = os.time() * 1000 + 1000

            MP.TriggerClientEvent(-1, "CountdownStop", tostring(counter))

            MP.CancelEventTimer("CounterEvent")

            counter = 0

            return
        end

end
function parseMessage(message)
    -- local command, seconds = message:match("^(%S+)%s*(%d*)")
    local command = message:match("^(%S+)")
    local seconds = tonumber(message:match("(%d+)"))
    print(command)
    print(seconds)
    
    --change or add the name of the in game command.
    if command == "/race" or command == "/countdown" then
            
        if seconds == nil then
            seconds = 5
        --Here you can set the max countdown by changing 60.
        elseif seconds < 1 or seconds > 60 then
            seconds = -1
        end
        
        print(seconds)

        return seconds
    end
    return -1
end