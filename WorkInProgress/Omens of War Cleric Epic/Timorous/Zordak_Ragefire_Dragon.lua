-- 2.0 Cleric Epic fight Zordak Ragefire Dragon Form  --Drogerin

function event_spawn(e)
	eq.set_next_hp_event(60);

end

function event_combat(e)
	if (e.joined) then
		e.self:Say("You fight well, but behold my true form and my true power!");
	end
end

function event_hp(e)
	if (e.hp_event == 60) then
		local xloc = e.self:GetX();
		local yloc = e.self:GetY();
		local zloc = e.self:GetZ();
		local heading = e.self:GetHeading();
		eq.spawn2(0,0,xloc + math.random(-15,15),yloc + math.random(-15,15),zloc,heading);		-- Need info on add "Zordak`s Minion // Database Entry // NPCID
		eq.spawn2(0,0,xloc + math.random(-15,15),yloc + math.random(-15,15),zloc,heading); 		-- Need info on add "Zordak`s Minion // Database Entry // NPCID
		eq.set_next_hp_event(25);
	elseif (e.hp_event == 25) then
		local xloc = e.self:GetX();
		local yloc = e.self:GetY();
		local zloc = e.self:GetZ();
		local heading = e.self:GetHeading();
		e.self:Say("Do not think it will be so easy this time!");
		eq.spawn2(0,0,xloc + math.random(-15,15),yloc + math.random(-15,15),zloc,heading);		-- Need info on add "Zordak`s Minion // Database Entry // NPCID
		eq.spawn2(0,0,xloc + math.random(-15,15),yloc + math.random(-15,15),zloc,heading);		-- Need info on add "Zordak`s Minion // Database Entry // NPCID
		eq.spawn2(0,0,xloc + math.random(-15,15),yloc + math.random(-15,15),zloc,heading);		-- Need info on add "Zordak`s Minion // Database Entry // NPCID
	end
end
		
function event_death_complete(e)
		local xloc = e.self:GetX();
		local yloc = e.self:GetY();
		local zloc = e.self:GetZ();
		local heading = e.self:GetHeading();
		eq.spawn2(NPCID,0,0,xloc,yloc,zloc,heading); -- Need NPCID of Chest that spawns here.
end
	