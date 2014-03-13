-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Grrreetings, " .. e.other:GetName() .. ", would you like to share a roasted rat steak or perhaps a tall glass of gnomish spirits? Have no fear of my appearance. My bark is meaner than my bite! Grraw haw haw!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 1779,item2 = 14585})) then
		e.self:Say("I had hoped to see the last of these sorrowful symbols. There is little I can tell you of the details of the kobold religion as I was rescued from death as a pup by the Deep Muses and reunited with Brell Serilis. What I know is this, the deity this symbol represents is named Rolfron Zek. He was a devoted shaman of Brell before the Abandonment, now he is the lord of Despair and Hopelessness. There is a shaman of Rolfron that teaches the local kobolds, he carries with him a doctrine. Recover the doctrine and take it with this translation scroll back to your Temple");
		e.other:SummonItem(1780);
		e.other:Ding();
		e.other:AddEXP(1500);
		e.other:Faction(210,20,0);
		e.other:Faction(115,20,0);
		e.other:Faction(71,-20,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
