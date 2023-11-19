-- Breakdown in Communication #3: Riwwi

function event_say(e)
	if e.message:findi("Hail") then
		e.other:Message(MT.NPCQuestSay, "Saney Jakis says 'Pleasure to meet you, ".. e.other:GetName() .. "! How are you making out? My friend and I traveled from afar in search of adventure and we've certainly found it. This strange land has delivered excitement in spades. Hasn't it, Rorrst?");
    elseif e.message:findi("key") then
		e.other:Message(MT.NPCQuestSay, "Saney Jakis says 'Are you trying to reason with Rorrst?'  Saney unsuccessfully attempts to stifle her tinny, high-pitch chortle.  'Now THAT'S a waste of time, and I would know.  Personal experience.  If you want something from him you'll have to try a different angle:  Appeal to his coinpurse.  Money talks.  Tell him I said so.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
