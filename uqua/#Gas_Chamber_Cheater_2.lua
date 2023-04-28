function event_spawn(e)
	local qglobals = eq.get_qglobals(e.self); 
	local instance_id = eq.get_zone_instance_id();
	local is_complete = qglobals[instance_id.. '_gaschmb2complete'] ~= nil
	local x,y = e.self:GetX(), e.self:GetY();

	if is_complete then
		eq.depop();
	end

	eq.set_proximity(x - 20, x + 20, y - 20, y + 20);
end

function event_enter(e)
	e.self:SpellFinished(982,e.other); -- DT
end

function event_signal(e)
	if e.signal == 1 then
		eq.depop();
	end
end

function event_slay(e)
	if e.other:IsClient() or e.other:IsPet() then -- not sure why this is necessary, but otherwise will occasionally spawn adds when an event mob dies
		local x,y,z,h = e.other:GetX(), e.other:GetY(), e.other:GetZ(), e.other:GetHeading();
		eq.spawn2(eq.ChooseRandom(292043,292044,292045,292046,292047,292048,292049,292050),0,0,x,y,z,h); -- NPC(s): #a_coercing_spirit (292043), #a_malevolent_spirit (292044), #a_slighted_spirit (292045), #a_spiteful_spirit (292046), #a_vengeful_spirit (292047), #a_vindictive_spirit (292048), #an_avenging_spirit (292049), #an_infuriated_spirit (292050)
	end
end
