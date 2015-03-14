function event_spawn(e)
	eq.set_timer("sing",1040000);
end

function event_timer(e)
	local sing_it;
	if(e.timer == "sing") then
		sing_it = eq.ChooseRandom(1,2,3,4,5,6);
		if(sing_it == 1) then
			e.self:Say("Let's hear some music.");
			bard_sing();
		elseif(sing_it == 2) then
			e.self:Say("Music!! Music!!");
			bard_sing();
		elseif(sing_it == 3) then
			e.self:Say("Play us some music bard!!");
			bard_sing();
		elseif(sing_it == 4) then
			e.self:Say("Let's liven this pub up!");
			bard_sing();
		elseif(sing_it == 5) then
			e.self:Say("Try to cheer this place up, bard.");
			bard_sing();
		elseif(sing_it == 6) then
			e.self:Say("Where is the music? I don't pay you bards to drink all the grog!!");
		end
	end
end

function bard_sing()
	eq.signal(10141,1);
	eq.signal(10158,1);
	eq.signal(10165,1);
end