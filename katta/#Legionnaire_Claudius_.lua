local count = 0;

function event_spawn(e)
	eq.set_timer("attack",2000);
end

function event_timer(e)
	if(e.timer == "attack") then
		count = count + 1;
		if(count == 1) then
			eq.spawn2(160456,31,0,-1191,-6,-266,0); --#Legionnaire (160456)
		elseif(count == 2) then
			eq.spawn2(160456,31,0,-1191,-6,-266,0); --#Legionnaire (160456)
			eq.spawn2(160456,31,0,-1191,-6,-266,0); --#Legionnaire (160456)
			eq.spawn2(160456,31,0,-1005,54,-266,0); --#Legionnaire (160456)
		elseif(count == 3) then
			e.self:Say("I have been discovered! You should have left well enough alone!!!")
			eq.stop_timer("attack");
		end
	end
end
