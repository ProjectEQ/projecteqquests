--an_inferno_mephit (223095)
--Phase 1 - Kazrok of Fire Trial
--potimeb

function event_spawn(e)
	if math.random(100) >= 50 then --50% chance to be unmezzable (default is mezzable)
		e.self:SetSpecialAbility(SpecialAbility.unmezable, 1);	--flag as unmezzable
	end
	
	if math.random(100) >= 40 then	--default slow mitigation 20%, but has a chance also be fully slowable
		e.self:ModifyNPCStat("slow_mitigation","0");
	end
end

function event_death_complete(e)
	-- send a signal to the #fire_trigger that I died
	eq.signal(223173,1);
end