function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail. %s.  I am Niclaus Ressinn. loyal Paladin of Life. I am scouting the Qeynos Hills on orders from High Priestess Jahnda.  We have received reports of undead prowling these hills of late.",e.other:GetName()));
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 4 or e.wp == 8) then
		e.self:DoAnim(62);
	elseif(e.wp == 5) then
		e.self:SetRunning(true);
	elseif(e.wp == 6) then
		e.self:DoAnim(29);
	elseif(e.wp == 7) then
		e.self:Say("Guard! Come quick! The undead gather near the ruins of Geupal!");
		e.self:SetRunning(false);
	elseif(e.wp == 9) then
		e.self:DoAnim(7);
	elseif(e.wp == 10) then
		e.self:Say("Shh.. The fiends seems to dwell amongst the ruins. They wander off but eventually congregate back here. Shh.. OK NOW! RODCET PROTECT US!");
		e.self:SetRunning(true);
	elseif(e.wp == 11) then
		e.self:SetRunning(false);
	end
end
