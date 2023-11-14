function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "4" and e.message:findi("hail") then
		e.self:Say("I have nothing for you unless say you have the  [right price].");
	elseif qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "4" and e.message:findi("right price") then
		e.self:Say("I have just placed my 'ands on this 'ere book and I'd be willin to part with it for a mighty price else you could try and [defeat] me crew.");
	elseif qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "4" and e.message:findi("defeat") then
		e.self:Say("I am sorry, we don't currently have any work available. We are still setting up, and cleaning up the orcish filth from this area. Return later, I should have some work available.");
		make_attackable(e.self, true);
		eq.set_timer("adds", 5 * 1000); -- 5 Sec
		eq.set_timer("depop",15 * 60 *1000); -- 15 Minutes
		e.self:AddToHateList(e.other,1);
	elseif e.message:findi("hail") then
		e.self:Say("Go away!");
	end
end

function event_timer(e)
	eq.stop_timer(e.timer);
	if e.timer == "adds" then
		e.self:Say("You sorry sacks of vermin come aid me now!");
		eq.spawn2(225380,0,0,e.self:GetX()-20,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading());	-- NPC: a_lackey_of_Quigli
		eq.spawn2(225381,0,0,e.self:GetX()-20,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());	-- NPC: a_swabby_of_Quigli
		eq.spawn2(225381,0,0,e.self:GetX()-20,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading());	-- NPC: a_swabby_of_Quigli
		eq.spawn2(225382,0,0,e.self:GetX()-20,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading());	-- NPC: a_scallywag_of_Quigli
	elseif e.timer == "depop" then
		eq.depop_with_timer();
		eq.depop_all(225380);
		eq.depop_all(225381);
		eq.depop_all(225382);
	end
end

function event_death_complete(e)
	eq.depop_all(225380);
	eq.depop_all(225381);
	eq.depop_all(225382);
end

function make_attackable(mob, attackable)
	mob:SetSpecialAbility(SpecialAbility.immune_melee, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.immune_magic, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.immune_aggro, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, attackable and 0 or 1)
	mob:SetSpecialAbility(SpecialAbility.no_harm_from_client, attackable and 0 or 1)
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end