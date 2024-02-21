-- an angry goblin, Frontier Mountains
-- Second part of the chardok quest, initiated by Herald Telcha
-- Regal Band of Bathezid

function event_say(e)
	if(e.other:HasItem(5728)) then -- we handed the Signet of Service yet
		-- the goblin won't talk to the player unless we did the beginning of the quest
		if(e.message:findi("hail")) then
			e.self:Say("'Go away, my life is miserable enough!' The angry goblin looks at you more closely, his rage fading for a moment. 'Are you here with the evidence I was promised? Give it to me if you have it.'");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 6474})) then -- we handed Report to Skargus
		eq.start(134);
		e.self:Emote("howls in triumph! 'This is just what I needed! Skargus is mine now, wait until he finds out, just wait! His death is close at hand. Follow me and I'll take you to Skargus's chamber, you can wait there while I take this report to the chief!'");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,{exp = 50000});
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 11) then
		e.self:Shout("I have you now Skargus, you traitor! Even now I'm taking this report of slave-trading to the chief! Your days here are at an end!");
		eq.unique_spawn(81126,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),250);
		eq.depop_with_timer();
	end
end
