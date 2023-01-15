-- npc to start Garzicor quest script

local musthelp = 0;

function event_spawn(e)
	eq.set_timer("proxsay",2000);
end
 
function event_proximity_say(e)
	local xloc = e.other:GetX();
	local yloc = e.other:GetY();
	local nxloc = e.self:GetX();
	local nyloc = e.self:GetY();
	local xdiff = xloc - nxloc;
	local ydiff = yloc - nyloc;
    if(e.message:findi("hail") and e.other:GetGM()) then -- debug only
        e.self:Say("Your x is ".. xdiff .." and your y is " .. ydiff .." from me!");
    end
	if(e.message:findi("Remember, Garzicor")) then
		eq.disable_proximity_say();
		eq.set_timer("pause",60000);
	elseif(e.message:findi("you are one but two")) then
		eq.unique_spawn(123193,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0); --#a_ghostly_presence (123193)
		eq.depop_with_timer();
	end
end
 
function event_timer(e)
	if(e.timer == "pause") then
		eq.stop_timer("pause");
		eq.set_timer("help",6000);
		musthelp = 0;
	elseif(e.timer == "proxsay") then
		local xloc = e.self:GetX();
		local yloc = e.self:GetY();
		local zloc = e.self:GetZ();
		eq.set_proximity(e.self:GetX()-30, e.self:GetX()+30, e.self:GetY()-30, e.self:GetY()+30, -999999, 999999, true);
		eq.enable_proximity_say();
		eq.stop_timer("proxsay");
	elseif(e.timer == "help") then
		musthelp = musthelp +1;
		if(musthelp == 1) then
			e.self:Emote("Help");
		elseif(musthelp == 2) then
			e.self:Emote("Must go home");
		elseif(musthelp == 3) then
			e.self:Emote("Need vengeance");
		elseif(musthelp == 4) then
			e.self:Emote("Veeshan awaits");
		elseif(musthelp == 5) then
			e.self:Emote("Kromzek must be made to pay");
		elseif(musthelp == 6) then
			e.self:Emote("So tired");
		elseif(musthelp == 7) then
			e.self:Emote("Time to go");
		elseif(musthelp == 8) then
			e.self:Emote("Blood must be shed");
		elseif(musthelp == 9) then
			e.self:Emote("Home !");
		elseif(musthelp == 10) then
			e.self:Emote("Vengeance !");
		elseif(musthelp == 11) then
			e.self:Emote("Home !");
		elseif(musthelp == 12) then
			e.self:Emote("Vengeance !");
		elseif(musthelp == 13) then
			e.self:Emote("I am one but two");
		elseif(musthelp == 14) then
			eq.stop_timer("help");
			e.self:Emote("I am sorry");
			eq.create_ground_object(1889, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
			eq.create_ground_object(1888, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
			musthelp = 0;
			eq.depop_with_timer();
		end
	end
end
