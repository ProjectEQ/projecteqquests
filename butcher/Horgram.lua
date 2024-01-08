--Frostfell A Gift for Tinam (#4) -- TODO Update Task ID's

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Greetings there stranger, how can I help you?");
	elseif e.message:findi("gem") then
        if e.other:IsTaskActive(4) then
            e.self:Say("Ah so that geezer sent you to collect the gem from me? Alright, well there is one [thing] in the world that I want and if you get it for me, I will trade you the gem gladly.");
        end
    elseif e.message:findi("thing") then
        if e.other:IsTaskActive(4) then
            e.self:Say("I want three strands from the top of Lady Hagbletha's head. Oh she is the fairest of them all! If I could just have some of her hair! I would go myself but I am afraid she would eat me if I tried. Perhaps you can talk to her? You will find her near a dwarven statue in the canyons west of here, connecting this region to the shore.");
        end    
    end
end

function event_trade(e)
    local item_lib = require("items");
    if e.other:IsTaskActivityActive(4,8) then -- Frostfell A Gift for Tinam (#4) Activity ID 8 active
        if item_lib.check_turn_in(e.trade, {item1 = 87542}) then -- Lock of Hagbletha's Hair
			e.self:Say("Well I'll be! 'Horgram grabs the hairs from you and holds them close. 'Here take the gem, these hairs are more precious than anything else in the entire world!")
			e.other:UpdateTaskActivity(4,8,1); -- Frostfell A Gift for Tinam (#4) Activity ID 8 complete
            e.other:SummonItem(87541); -- Horgram's Gem
		end
    end
    item_lib.return_items(e.self, e.other, e.trade);
end