-- ecommons\Magus_Zeir.lua NPCID 22114

function event_say(e)
	if(e.other:KeyRingCheck(41000) or e.other:HasItem(41000)) then
		if(e.message:findi("hail")) then
			e.self:Say("Welcome, brave " .. e.other:GetName() .. ".  You have to be brave to entertain the use of our magic.  It's not that I don't trust the spell or my companions, it's just that the auras of the stones we found are so unstable and strange.  We are still trying to learn the nature of the magic.  It really is unlike any other magic we've seen on Norrath, and it's very powerful.  One time, when I cast the spell on a young Vah Shir, she burst into a furry cloud of... Perhaps I shouldn't talk about that.  Tell me where you would like to go and I will send you there.  I can send you to any of the other camps in [" .. eq.say_link("Butcherblock",false,"Butcherblock") .. "], [" .. eq.say_link("Everfrost",false,"Everfrost") .. "], [" .. eq.say_link("Nedaria's Landing",false,"Nedaria's Landing") .. "], [" .. eq.say_link("North Ro",false,"North Ro") .. "], or [" .. eq.say_link("South Ro",false,"South Ro") .. "].");
		elseif(e.message:findi("butcherblock")) then
			e.self:CastSpell(4179,e.other:GetID(),0,1); -- Spell: Teleport: Butcherblock
		elseif(e.message:findi("everfrost")) then
			e.self:CastSpell(4180,e.other:GetID(),0,1); -- Spell: Teleport: Everfrost
		elseif(e.message:findi("nedaria")) then
			e.self:CastSpell(4580,e.other:GetID(),0,1); -- Spell: Teleport: Nedaria
		elseif(e.message:findi("north ro")) then
		  e.self:CastSpell(4177,e.other:GetID(),0,1); -- Spell: Teleport: North Ro

		elseif(e.message:findi("south ro")) then
		  e.self:CastSpell(4178,e.other:GetID(),0,1); -- Spell: Teleport: South Ro

		end
	else -- No Adventurers Stone
		if(e.message:findi("hail")) then
			e.self:Say("You will have to excuse me, I am quite busy studying this Farstone and the possibility of using the magic stored inside of it.  Perhaps you should talk to those at the Wayfarer camps to see if they have any use for you.  I have enough time to send you to [" .. eq.say_link("Nedaria's Landing") .. "], if you'd like.");
		elseif(e.message:findi("nedaria")) then
			e.self:CastSpell(4580,e.other:GetID(),0,1); -- Spell: Teleport: Nedaria
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
