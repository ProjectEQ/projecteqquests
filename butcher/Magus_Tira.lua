-- butcher\Magus_Tira.lua NPCID 68133

function event_say(e)
	--Adventurers Stone
	if(e.other:KeyRingCheck(41000) or e.other:HasItem(41000)) then
		if(e.message:findi("hail")) then
			e.self:Say("And how are you today, " .. e.other:GetName() .. "?  Ready to do some traveling?  Hurry up, then.  I have lots of things I need to do today.  Tell me where you would like to go and I will send you there.  I can send you to any of the other camps in [" .. eq.say_link("Everfrost",false,"Everfrost") .. "], [" .. eq.say_link("Commonlands",false,"Commonlands") .. "], [" .. eq.say_link("Nedaria's Landing",false,"Nedaria's Landing") .. "], [" .. eq.say_link("North Ro",false,"North Ro") .. "], or [" .. eq.say_link("South Ro",false,"South Ro") .. "].  Hopefully I won't burn my hands this time!  Long story, but my cohort, Gaelan Charhands, didn't tell me one of the words of the spell as a joke.  Apparently it's funny for a beautiful gnome like myself to get her hands singed.  I'll get him back some day!");
		
		elseif(e.message:findi("everfrost")) then
			e.self:CastSpell(4180,e.other:GetID(),0,1); -- Spell: Teleport: Everfrost
		elseif(e.message:findi("nedaria")) then
			e.self:CastSpell(4580,e.other:GetID(),0,1); -- Spell: Teleport: Nedaria

		elseif(e.message:findi("north ro")) then
      e.self:CastSpell(4177,e.other:GetID(),0,1); -- Spell: Teleport: North Ro		 

		elseif(e.message:findi("south ro")) then
			e.self:CastSpell(4178,e.other:GetID(),0,1); -- Spell: Teleport: South Ro		

		elseif(e.message:findi("commonlands")) then
			e.self:CastSpell(4176,e.other:GetID(),0,1); -- Spell: Teleport: East Commons
		
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
