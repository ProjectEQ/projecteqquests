-- Converted to .lua by Speedz

function event_say(e)
local qglobals = eq.get_qglobals(e.other)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". When a hero of our world is slain their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity  it is my duty to [" .. eq.say_link("bind my soul",false,"bind your soul") .. "] to this location if that is your wish.");
	elseif(e.message:findi("bind my soul")) then
		e.self:Say("Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1); -- Spell: Bind Affinity
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("identify this mangled head")) then
		e.self:Say("We soulbinders do not deal in such foul magic, we purged that [" .. eq.say_link("one") .. "] from our ranks long ago.");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("one")) then
		e.self:Say("I will not talk about him and I assure you that none of our membership will. If you must know more, talk to a man named Caskin about his friend. I don't remember his last name. Now please go away and don't mention this again.");		
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
