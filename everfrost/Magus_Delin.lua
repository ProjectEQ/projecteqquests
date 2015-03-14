-- everfrost\Magus_Delin.lua NPCID 30088

function event_say(e)
	--Adventurers Stone
	if(e.other:KeyRingCheck(41000) or e.other:HasItem(41000)) then
		if(e.message:findi("hail")) then
			e.self:Say("You're going to need to have a fair amount of faith in me and my friends.  I make it a policy to tell all of the travelers that come to me that this is not a perfected magic and probably never will be.  The magic we are using is, in my opinion, not of Norrathian origins.  Or perhaps I'm simply an eccentric who hopes there is a greater force out there that is granting us the use of new magics.  Anyway, enough chatter.  Tell me where you would like to go and I will send you there.  I can send you to any of the other camps in [" .. eq.say_link("Butcherblock",false,"Butcherblock") .. "], [" .. eq.say_link("Commonlands",false,"Commonlands") .. "], [" .. eq.say_link("Nedaria's Landing",false,"Nedaria's Landing") .. "], [" .. eq.say_link("North Ro",false,"North Ro") .. "], or [" .. eq.say_link("South Ro",false,"South Ro") .. "].  Please be still as I do this.");
		elseif(e.message:findi("commonlands")) then
			e.self:CastSpell(4176,e.other:GetID(),0,1);
		elseif(e.message:findi("butcherblock")) then
			e.self:CastSpell(4179,e.other:GetID(),0,1);
		elseif(e.message:findi("nedaria")) then
			e.self:CastSpell(4580,e.other:GetID(),0,1);
		elseif(e.message:findi("north ro")) then
			e.self:CastSpell(4177,e.other:GetID(),0,1);
		elseif(e.message:findi("south ro")) then
			e.self:CastSpell(4178,e.other:GetID(),0,1);
		end
	else --no Adventurers Stone
		if(e.message:findi("hail")) then
			e.self:Say("You will have to excuse me, I am quite busy studying this Farstone and the possibility of using the magic stored inside of it.  Perhaps you should talk to those at the Wayfarer camps to see if they have any use for you.  I have enough time to send you to [" .. eq.say_link("Nedaria's Landing") .. "], if you'd like.");
		elseif(e.message:findi("nedaria")) then
			e.self:CastSpell(4580,e.other:GetID(),0,1);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end