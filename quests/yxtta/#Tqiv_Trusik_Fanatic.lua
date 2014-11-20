-- #Tqiv_Trusik_Fanatic (291123) aka Xounii Shifter 
--He takes many shapes as he roams through yxtta (similar to which primal he is close to)
--At 50% he changes into Himself
--at 15% he changes into Xounii Shifter.
function event_spawn(e)
	--starting as cragbeast
	e.self:SetRace(390)
	e.self:TempName("a_cragbeast_bonecruncher")
	eq.start(537896)
	eq.set_next_hp_event(50)
end

function event_waypoint_arrive(e)
	
	if (e.wp == 17) then
		e.self:SetRace(326)
		e.self:TempName("a_cavernous_lifesipper")
	elseif (e.wp == 28) then
		e.self:SetRace(22)
		e.self:TempName("a_voracious_beetle")
	elseif (e.wp == 38) then
		e.self:SetRace(390)
		e.self:TempName("a_cragbeast_bonecruncher")
	end
end

function event_hp(e)
	if (e.hp_event == 50) then
		e.self:SetRace(385)
		e.self:TempName("Tqiv_Trusik_Fanatic")
		eq.set_next_hp_event(15)
	elseif (e.hp_event == 15) then
		e.self:SetRace(5)
		e.self:TempName("Xounii Shifter")
	end
end