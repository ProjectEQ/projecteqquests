-- natimbi\Magus_Releua.lua NPCID 280060

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you'd like to go to [" .. eq.say_link("Nedaria",false,"Nedaria") .. "]'s Landing or to the Queen of Thorns in [" .. eq.say_link("Abysmal Sea",false,"Abysmal Sea") .. "], I can use my Farstone magic to send you.  Speak up and tell me where you wish to travel.");
	elseif(e.message:findi("nedaria")) then
		e.self:CastSpell(4580,e.other:GetID());
	elseif(e.message:findi("abysmal sea")) then
		--Translocate Abysmal is unknown
		e.other:MovePC(279,39,-150,139.05,90);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end