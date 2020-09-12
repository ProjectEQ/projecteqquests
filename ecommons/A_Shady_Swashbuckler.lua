function event_spawn(e)
    eq.debug("timer")
    eq.set_timer("1", 60);
end
function event_say(e)
    eq.debug("say triggered")
    relays()
end

function event_timer(e)
    eq.debug("timer")
    if(e.timer ~= "1") then
        return
    end
    #relays()
end

function relays(e)
    local rest_lib = require("rest");
    local result, err = rest_lib.request("GET", "http://localhost:9933/api/relays", "");
    if err then
        eq.debug("rest failed: " .. err);
        return
    end
    var_dump(result)
    for k, queues in pairs(result) do
        if type(queues) == 'table' then
            for id, queue in pairs(queues) do
                err = processAction(queue)
                if err then
                    eq.debug("failed processAction: " .. err);
                end
            end
        end
    end    
end

function processAction(queue)
    if queue.action == "register" then
        eq.cross_zone_message_player_by_name(MT.Tell, queue.target, queue.from .. " on discord is looking to identify as you. If this is you, [" .. eq.say_link("#register accept " .. queue.code, true, "accept") .. "], otherwise [" .. eq.say_link("#register deny " .. queue.code, true, "deny") .. "] or [" .. eq.say_link("#register report " .. queue.code, true, "report") .. "] this request.");
        return
    end
    eq.debug("unknown action: " .. queue.action)
end