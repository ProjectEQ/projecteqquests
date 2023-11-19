-- Breakdown in Communication #3: Riwwi

function event_say(e)
	if e.message:findi("Hail") then
		e.other:Message(MT.NPCQuestSay, "Rorrst smirks and nods politely your way.  The glint of a silvery key hanging from a chain around his neck catches your eye.");
    elseif e.message:findi("key") then
        e.other:Message(MT.NPCQuestSay, "Rorrst says 'Oh what, this little thing?'  He grasps the key with one hand and holds it forth, displaying it proudly.  This be my pride and joy, aye.  Stolen right out from under the nose of those blasted Muramites.  They be mighty angry at my trespass, I gather.");
	elseif e.message:findi("money talks") then
        e.other:Message(MT.NPCQuestSay, "Rorrst chuckles. 'Money talks?  Aye, it does.  Keep in mind I still can't give you the original, it means far too much to me.  If you're dying to have the key you can make a copy.  Say twenty-five thousand gold.  It's a nice round number.  That should be relatively trivial for someone of your background to obtain.'");
	end
end

function event_trade(e)
	local item_lib = require('items');
	if item_lib.check_turn_in(e.trade, {gold = 25000}) then -- 25000 gold
		e.other:QuestReward(e.self,0,0,0,0,52181,1000); -- Impression of a Key
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
