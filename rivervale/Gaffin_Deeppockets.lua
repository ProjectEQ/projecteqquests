function event_spawn(e)
	eq.set_timer("lenny",950000);
end

function event_timer(e)
	if(timer == lenny) then
		e.self:Say("Lenny, we has a problem. Stanos is back, and he ain't happy. He told me to tell ya that he would be calling in his markers soon. I reckon ya know what that means, and that's bad business with the Circle. Whatcha wanna do?");
		eq.signal(19062,1); -- NPC: Lendel_Deeppockets Rogue Guildmaster
	end
end
