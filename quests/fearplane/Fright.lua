--Spawns an iksar broodling on the death of the golems 75% of the time.

function event_signal(e)
	if(e.signal == 0) then
		e.self:Say("Such is the will of Cazic-Thule!");
	end
	if(e.signal == 1) then
		e.self:Say("We obey!");
	end
end

function event_death_complete(e)
	local a = eq.ChooseRandom(72105,72105,72105,0);
	-- local x = e.self:GetX();
	-- local y = e.self:GetY();
	-- local z = e.self:GetZ();
	-- local h = e.self:GetHeading();
	eq.spawn2(a,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

--Submitted by: Jim Mills (Gilmore Girls`Is`Awesome`XOXO)
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
