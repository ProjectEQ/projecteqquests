--This is the true version of Shei. When aggro'd, 4 adds will spawn. If anyone is killed by this mob, a random mob (of 4 possible) will spawn.
local adds;

function event_spawn(e)
	adds = 0;
end

function event_combat(e)
	if(e.joined == true) then
		if(adds == 0) then
			eq.spawn2(179161,0,0,-1714,1128,19.7,128);
			eq.spawn2(179147,0,0,-1715,1034,19.7,0);
			eq.spawn2(179160,0,0,-1771,1126,18.2,82);
			eq.spawn2(179142,0,0,-1769,1035,18.2,45);
			adds = 1;
		end
	end
end

function event_slay(e)
	local a = eq.ChooseRandom(179161,179147,179160,179142);
	-- local x = e.self:GetX();
	-- local y = e.self:GetY();
	-- local z = e.self:GetZ();
	-- local h = e.self:GetHeading();
	eq.spawn2(a,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

--Submitted by Jim Mills
--modified by Reno
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
