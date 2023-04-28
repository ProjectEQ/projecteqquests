--spawns when failing gas chamber
function event_timer(e)
	if e.timer == "aoe" then
		eq.stop_timer("aoe");
		e.self:CastSpell(2490,e.self:GetID()); -- Spell: detonation
		eq.set_timer("aoetwo", 8 * 1000);
	elseif e.timer == "aoetwo" then
		eq.stop_timer("aoetwo");
		e.self:CastSpell(2490,e.self:GetID()); -- Spell: detonation
		eq.set_timer("aoethree", 8 * 1000);
	elseif e.timer == "aoethree" then
		eq.stop_timer("aoethree");
		e.self:CastSpell(2490,e.self:GetID()); -- Spell: detonation
		eq.depop();
	end
end

function event_spawn(e)
	eq.set_timer("aoe", 1 * 1000);
end

function event_slay(e)
	if e.other:IsClient() or e.other:IsPet() then -- not sure why this is necessary, but otherwise will occasionally spawn adds when an event mob dies
		local x,y,z,h = e.other:GetX(), e.other:GetY(), e.other:GetZ(), e.other:GetHeading();
		eq.spawn2(eq.ChooseRandom(292043,292044,292045,292046,292047,292048,292049,292050),0,0,x,y,z,h); -- NPC(s): #a_coercing_spirit (292043), #a_malevolent_spirit (292044), #a_slighted_spirit (292045), #a_spiteful_spirit (292046), #a_vengeful_spirit (292047), #a_vindictive_spirit (292048), #an_avenging_spirit (292049), #an_infuriated_spirit (292050)
	end
end
