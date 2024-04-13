-- nedaria\Magus_Wenla.lua NPCID 182117

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". I can provide travel to other magi in [" .. eq.say_link("Butcherblock",false,"Butcherblock") .. "], [" .. eq.say_link("Commonlands",false,"Commonlands") .. "], [" .. eq.say_link("Everfrost",false,"Everfrost") .. "], [" .. eq.say_link("North Ro",false,"North Ro") .. "], and [" .. eq.say_link("South Ro",false,"South Ro") .. "]. I can also send you to [" .. eq.say_link("Natimbi",false,"Natimbi") .. "], the shores of Taelosia, or to the Queen of Thorns in [" .. eq.say_link("Abysmal Sea",false,"Abysmal Sea") .. "]. Just tell me where you'd like to go.");
	elseif(e.message:findi("butcherblock")) then
		e.self:CastSpell(4179,e.other:GetID(),0,1); -- Spell: Teleport: Butcherblock

	elseif(e.message:findi("everfrost")) then
		e.self:CastSpell(4180,e.other:GetID(),0,1); -- Spell: Teleport: Everfrost

	elseif(e.message:findi("natimbi")) then
		e.other:MovePC(280, -1557, -853, 241,180); -- Zone: natimbi

	elseif(e.message:findi("north ro")) then
		if eq.is_prophecy_of_ro_enabled() then
			e.other:MovePC(Zone.northro, 914, 2679, -25, 20);
			return
		end
		--e.self:CastSpell(4177,e.other:GetID(),0,1);
		e.other:MovePC(Zone.nro, 914, 2679, -25, 20); -- Zone: nro
		return
	elseif(e.message:findi("south ro")) then
		if eq.is_prophecy_of_ro_enabled() then
			e.other:MovePC(Zone.southro, 1053, -1461, -25.9, 456)
			return
		end
		--e.self:CastSpell(4178,e.other:GetID(),0,1);
		e.other:MovePC(Zone.sro, 1033, -1447, -23, 166)

	elseif(e.message:findi("commonlands")) then
		--e.self:CastSpell(4176,e.other:GetID(),0,1);
		e.other:MovePC(22,-140,-1520,3,280); -- needs_heading_validation

	elseif(e.message:findi("abysmal sea")) then
		--Translocate Abysmal is unknown
		e.other:MovePC(279,39,-150,141,180); -- Zone: abysmal
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
