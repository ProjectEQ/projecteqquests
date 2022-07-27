--Curate_Firetender (294612)
--Ikkinz Raid #4: Chambers of Destruction 

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);	
	else
		eq.stop_timer("OOBcheck");
	end
end


function event_timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() < 693 or e.self:GetY() > -665) then
		e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		e.self:GotoBind();
		e.self:WipeHateList();
		e.self:SetHP(e.self:GetMaxHP());
	else
		eq.set_timer("OOBcheck", 3 * 1000);
	end
end
end
function event_death_complete(e)
	eq.zone_emote(0,"Curate Firetender's corpse is burned by embers before finally laying dead upon the ground");
end
