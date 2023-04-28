--trap npcs

function event_waypoint_arrive(e)
	if e.self:GetGrid() == 1 and e.wp == 7 then --npcs from trap 1
		e.self:GotoBind();
		eq.signal(292042,1); --signal reset sequence on Trap Uqua 1
	elseif e.self:GetGrid() == 2 and e.wp == 12 then --npcs from trap 2
		e.self:GotoBind();
		eq.signal(292053,1); --signal reset sequence on Trap Uqua 2
	elseif e.self:GetGrid() == 3 and e.wp == 14 then --npcs from trap 3
		e.self:GotoBind();
		eq.signal(292054,1); --signal reset sequence on Trap Uqua 3
	elseif e.self:GetGrid() == 4 and e.wp == 22 then --npcs from trap 4
		e.self:GotoBind();
		eq.signal(292060,1); --signal reset sequence on Trap Uqua 4
	elseif e.self:GetGrid() == 6 and e.wp == 22 then --npcs from trap 5
		e.self:GotoBind();
		eq.signal(292059,1); --signal reset sequence on Trap Uqua 5
	elseif e.self:GetGrid() == 7 and e.wp == 22 then --npcs from trap 6
		e.self:GotoBind();
		eq.signal(292058,1); --signal reset sequence on Trap Uqua 6
	elseif e.self:GetGrid() == 8 and e.wp == 22 then --npcs from trap 7
		e.self:GotoBind();
		eq.signal(292057,1); --signal reset sequence on Trap Uqua 7
	elseif e.self:GetGrid() == 9 and e.wp == 9 then --npcs from trap 7
		e.self:GotoBind();
		eq.signal(292061,1); --signal reset sequence on Trap Uqua 7
	end
end

--check combat state too or no? tbd
function event_death_complete(e)
	if e.self:CastToNPC():GetGrid() == 1 then --npcs from trap 1
		eq.signal(292042,2); --signal Trap Uqua 1 npc died
	elseif e.self:CastToNPC():GetGrid() == 2 then --npcs from trap 2
		eq.signal(292053,2); --signal Trap Uqua 2 npc died
	elseif e.self:CastToNPC():GetGrid() == 3 then --npcs from trap 3
		eq.signal(292054,2); --signal Trap Uqua 3 npc died
	elseif e.self:CastToNPC():GetGrid() == 4 then --npcs from trap 4
		eq.signal(292060,2); --signal Trap Uqua 4 npc died
	elseif e.self:CastToNPC():GetGrid() == 6 then --npcs from trap 5
		eq.signal(292059,2); --signal Trap Uqua 5 npc died
	elseif e.self:CastToNPC():GetGrid() == 7 then --npcs from trap 6
		eq.signal(292058,2); --signal Trap Uqua 6 npc died
	elseif e.self:CastToNPC():GetGrid() == 8 then --npcs from trap 7
		eq.signal(292057,2); --signal Trap Uqua 7 npc died
	elseif e.self:CastToNPC():GetGrid() == 9 then --npcs from trap 8
		eq.signal(292061,2); --signal Trap Uqua 8 npc died
	end
end

function event_signal(e)
	if e.self:GetGrid() == 1 and e.signal == 1 then
		eq.depop();
	elseif e.self:GetGrid() == 2 and e.signal == 2 then
		eq.depop();
	elseif e.self:GetGrid() == 3 and e.signal == 3 then
		eq.depop();
	elseif e.self:GetGrid() == 4 and e.signal == 4 then
		eq.depop();
	elseif e.self:GetGrid() == 6 and e.signal == 5 then
		eq.depop();
	elseif e.self:GetGrid() == 7 and e.signal == 6 then
		eq.depop();
	elseif e.self:GetGrid() == 8 and e.signal == 7 then
		eq.depop();
	elseif e.self:GetGrid() == 9 and e.signal == 8 then
		eq.depop();
	end
end

function event_slay(e)
	if e.other:IsClient() or e.other:IsPet() then -- not sure why this is necessary, but otherwise will occasionally spawn adds when an event mob dies
		local x,y,z,h = e.other:GetX(), e.other:GetY(), e.other:GetZ(), e.other:GetHeading();
		eq.spawn2(eq.ChooseRandom(292043,292044,292045,292046,292047,292048,292049,292050),0,0,x,y,z,h); -- NPC(s): #a_coercing_spirit (292043), #a_malevolent_spirit (292044), #a_slighted_spirit (292045), #a_spiteful_spirit (292046), #a_vengeful_spirit (292047), #a_vindictive_spirit (292048), #an_avenging_spirit (292049), #an_infuriated_spirit (292050)
	end
end
