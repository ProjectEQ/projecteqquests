--Rogue Prequest NPC


function event_spawn(e)
    e.self:ModSkillDmgTaken(0, -99); -- 1h blunt
    e.self:ModSkillDmgTaken(2, -99); -- 2h blunt
    e.self:ModSkillDmgTaken(36,-99); -- piercing
    e.self:ModSkillDmgTaken(77,-99); -- 2h piercing
    e.self:ModSkillDmgTaken(1, -99); -- 1h slashing
    e.self:ModSkillDmgTaken(3, -99); -- 2h slashing
    e.self:ModSkillDmgTaken(8, 2500); -- backstab
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);
		eq.set_timer("powerup", 2 * 1000);
	else
		eq.stop_timer("OOBcheck");
	end
end


function event_timer(e)
	if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
		if (e.self:GetY() > 330) then
			e.self:CastSpell(3791, e.self:GetID())
			e.self:SetHP(e.self:GetMaxHP());
			e.self:ModifyNPCStat("hp", "25000");
			e.self:GotoBind();
			e.self:WipeHateList();
		else
			eq.set_timer("OOBcheck", 6 * 1000);
		end
	elseif(e.timer=="powerup") then
        e.self:ModifyNPCStat("hp", "10000000");
        e.self:SetHP(e.self:GetMaxHP());
        eq.stop_timer("powerup");
	end
end
