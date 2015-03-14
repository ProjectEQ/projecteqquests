-- guildlobby\Magus_Alaria.lua NPCID 344013

function event_spawn(e)
	--auto-afk check to not draw a model
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 75, xloc + 75, yloc - 75, yloc + 75);
end

function event_enter(e)
	e.other:Signal(1);
end

function event_exit(e)
	e.other:Signal(1);
end

function event_say(e)
	--Adventurers Stone
	if(e.other:KeyRingCheck(41000) or e.other:HasItem(41000)) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, " .. e.other:GetName() .. ". As you may have guessed I have been sent here by the Wayfarers Brotherhood to assist those that dare subject themselves to our magic. I promise you I have trained long and hard to be up to the task.  I only rarely make the type of mistakes you may have heard about regarding these spells of travel. Come, let me know where you would like to go and I'll send you on your way.  I can send you to any of the Wayfarer camps in [" .. eq.say_link("Butcherblock",false,"Butcherblock") .. "], [" .. eq.say_link("Commonlands",false,"Commonlands") .. "], [" .. eq.say_link("Everfrost",false,"Everfrost") .. "], [" .. eq.say_link("North Ro",false,"North Ro") .. "], [" .. eq.say_link("South Ro",false,"South Ro") .. "], or [" .. eq.say_link("Nedaria's Landing",false,"Nedaria's Landing") .. "].");
		elseif(e.message:findi("butcherblock")) then
			e.self:CastSpell(4179,e.other:GetID(),0,1);
		elseif(e.message:findi("commonlands")) then
			e.self:CastSpell(4176,e.other:GetID(),0,1);
		elseif(e.message:findi("everfrost")) then
			e.self:CastSpell(4180,e.other:GetID(),0,1);
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
