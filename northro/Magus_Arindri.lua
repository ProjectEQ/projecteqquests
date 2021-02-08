-- nro\Magus_Arindri.lua NPCID 34129

function event_say(e)
	--Adventurers Stone
	if(e.other:KeyRingCheck(41000) or e.other:HasItem(41000)) then
		if(e.message:findi("hail")) then
			e.self:Say("You endured the burning heat of the desert to come and use our magic!  I'm so excited.  We have been getting a lot of customers.  We've only lost a few.  I sometimes wonder if Vayzl has incorrectly used the spell on purpose to see the odd traveler explode into a spray of magic.  I do respect her, but I just don't understand dark elves, I guess.  I am far too precise and careful to make any mistakes... Well, not a second time.  Tell me where you would like to go and I will send you there.  I can send you to any of the other camps in [" .. eq.say_link("Butcherblock",false,"Butcherblock") .. "], [" .. eq.say_link("Commonlands",false,"Commonlands") .. "], [" .. eq.say_link("Everfrost",false,"Everfrost") .. "], [" .. eq.say_link("Nedaria's Landing",false,"Nedaria's Landing") .. "], or [" .. eq.say_link("South Ro",false,"South Ro") .. "].");
		
		elseif(e.message:findi("everfrost")) then
			e.self:CastSpell(4180,e.other:GetID(),0,1); -- Spell: Teleport: Everfrost
		elseif(e.message:findi("nedaria")) then
			e.self:CastSpell(4580,e.other:GetID(),0,1); -- Spell: Teleport: Nedaria
		elseif(e.message:findi("butcherblock")) then
			e.self:CastSpell(4179,e.other:GetID(),0,1); -- Spell: Teleport: Butcherblock

		elseif(e.message:findi("south ro")) then
			--e.self:CastSpell(4178,e.other:GetID(),0,1);		
			e.other:MovePC(35, 1033, -1447, -23, 166); -- Zone: sro

		elseif(e.message:findi("commonlands")) then
			--e.self:CastSpell(4176,e.other:GetID(),0,1);
			e.other:MovePC(22,-140,-1520,3,280); -- needs_heading_validation
		
		end
	else --no Adventurers Stone
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
