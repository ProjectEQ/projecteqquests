-- #Xeib_Darkskies (27109)
-- Dark Reign Merchant

-- hidden gm-only faction get and set
local FACTIONS = {norrathkeepers=1023, darkreign=1021}
local FACTION_LEVELS = {ally=2200, warmly=1000, kindly=600, amiable=300, indifferent=50, dubious=-600, threatenly=-900, scowls=-1000}

function faction_con(number)
    if (number >= 1101) then
        return "Ally";
    end
    if (number >= 701 and number <= 1100) then
        return "Warmly";
    end
    if(number >= 401 and number <= 700) then
        return "Kindly";
    end
    if(number >= 101 and number <=400) then
        return "Amiable";
    end
    if(number >= 0 and number <= 100) then
        return "Indifferent";
    end
    if (number >= -100 and number <= -1) then
        return "Apprehensive";
    end
    if (number >= -700 and number <= -101) then
        return "Dubious";
    end
    if (number >= -999 and number <= -701) then
        return "Threatenly";
    end
    if (number <= -1000) then
        return "Scowls";
    end
end

function adjust_faction(e, faction, desired)
    local charfaction = e.other:GetModCharacterFactionLevel(faction);
    local adjustment = 0;
    adjustment = charfaction - desired;
    adjustment = adjustment * -1;
    return adjustment;
end

function event_say(e)
    local is_gm = (e.other:Admin() > 80 and e.other:GetGM());
    if (is_gm) then       

        if (e.message:findi('hail')) then
            e.self:Say("I am the Faction Dude I will [" .. eq.say_link("help") .. "] you set [" .. eq.say_link("faction",false,"factions") .. "] [" .. eq.say_link("value",false,"values") .. "]");
            e.self:Say("you can also view your [" .. eq.say_link("current") .. "] faction levels.");
            return;
        end
        if (e.message:findi('faction')) then
            e.self:Say("The current factions I can help with are.")
            for key, value in pairs(FACTIONS) do
                e.self:Say(key);
            end
            return;
        end
        if (e.message:findi('value')) then
            e.self:Say("The faction values are.")
            for key, value in pairs(FACTION_LEVELS) do
                e.self:Say(key);
            end
            return;
        end
        if (e.message:findi("help")) then
            e.self:Say("To set a [" .. eq.say_link("faction") .. "] to a [" .. eq.say_link("value") .. "] say \"set <faction> <value>\"")
            return;
        end
        if (e.message:findi("current")) then
            for key, value in pairs(FACTIONS) do
                local charfaction = e.other:GetModCharacterFactionLevel(value);
                e.self:Say(key .." faction is: ".. faction_con(charfaction));
            end
            return;
        end
        if (e.message:findi("set")) then
            local wasGM = false;
            if (e.other:GetGM()) then
                e.other:SetGM(false);
                wasGM = true;
            end
            faction, value = e.message:match("set%s*(%a+)%s*(%a+)")
            e.other:Faction(FACTIONS[faction], adjust_faction(e, FACTIONS[faction], FACTION_LEVELS[value]))
            local charfaction = e.other:GetModCharacterFactionLevel(FACTIONS[faction]);
            e.self:Say(faction .." faction is: ".. faction_con(charfaction));
            if (wasGM) then
                e.other:SetGM(true);
            end
            return;
        end
    end
end