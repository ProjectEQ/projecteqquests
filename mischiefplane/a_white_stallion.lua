--a white stallion (NPC
--zone:  mischiefplane

--quest NPC for Crest of the Unicorns.  Will spawn White Lithiniath upon quest hand-in

function event_spawn(e)
	eq.depop(126612); -- despawns White Lithiniath if remained up 
end

function event_say(e)
	if e.message:findi("Hail") then
		e.self:Emote("stares at " .. e.other:GetCleanName() .. " unblinking with colorless eyes.");
	end
end

function event_trade(e)
    local item_lib = require("items");
	
    if item_lib.check_turn_in(e.trade, {item1 = 22856}) then --Check for Lithiniath's Horn
        e.self:QuestSay(e.other,"The madness has fled my mind and I am once again whole! Give Gelistial my regards, I must leave this place and try to quell the madness I have inflicted.");
		e.other:QuestReward(e.self,0,0,0,0,24869,100);  --  Crest of the Unicorns
		eq.depop_with_timer();
		eq.spawn2(126612,0,0,-1013,509,110.97,198);
    end

    item_lib.return_items(e.self, e.other, e.trade)
end

