-- Khati Sha Event
-- Created by Gonner
-- Converted to .lua by Speedz

local event_counter;

function event_spawn(e)
	eq.spawn2(154053,0,0,344.07, -323.49, -7.94,187); -- Spiritist_Kama_Resan V2
	eq.spawn2(154052,0,0,342.75, -232.48, -7.94,187); -- Spiritual Arcanist V1
	event_counter = 0;
end

function event_signal(e)
	
	if(e.signal == 1) then

		event_counter = event_counter + 1;

		if(event_counter == 1) then
			-- Room A
			eq.spawn2(154147,0,0,356.00,-250.00,-7.00,260);
			eq.spawn2(154147,0,0,328.00,-250.00,-7.00,260);
			eq.spawn2(154147,0,0,356.00,-219.00,-7.00,260);
			eq.spawn2(154147,0,0,328.00,-219.00,-7.00,260);
			-- Room B
			eq.spawn2(154147,0,0,356.00,-337.00,-7.00,260);
			eq.spawn2(154147,0,0,329.00,-337.00,-7.00,260);
			eq.spawn2(154147,0,0,329.00,-305.00,-7.00,260);
			eq.spawn2(154147,0,0,356.00,-305.00,-7.00,260);
		elseif (event_counter== 9) then
			-- Room A
			eq.spawn2(154147,0,0,356.00,-250.00,-7.00,260);
			eq.spawn2(154147,0,0,328.00,-250.00,-7.00,260);
			eq.spawn2(154147,0,0,356.00,-219.00,-7.00,260);
			eq.spawn2(154147,0,0,328.00,-219.00,-7.00,260);
			-- Room B
			eq.spawn2(154147,0,0,356.00,-337.00,-7.00,260);
			eq.spawn2(154147,0,0,329.00,-337.00,-7.00,260);
			eq.spawn2(154147,0,0,329.00,-305.00,-7.00,260);
			eq.spawn2(154147,0,0,356.00,-305.00,-7.00,260);
			eq.spawn2(154155,0,0,403.10,-239.98,37.06,130); -- Ward of death
		elseif(event_counter == 17) then
			eq.spawn2(154154,0,0,345.00,-277.00,-6.00,260); -- Ward of Life
		elseif(event_counter == 19) then
			eq.spawn2(eq.ChooseRandom(154095,154122),0,0,614.00,-345.00,-23.00,187); -- Spawn EVinvis or #raidman
		end

	elseif(e.signal == 3) then -- Succed
		eq.spawn2(154145,0,0,940.00,-610.00,-41.00,0); -- Spawn Kahti Sha
		eq.signal(154145,100); -- Signal Khati Sha to Shout
		eq.signal(154129,5,20); -- depops grimlings
		eq.signal(154151,6,10); -- emotes A Spiritual Arcanist V1
		eq.signal(154151,7,500); -- depops A Spiritual Arcanist V1
		e.self:Say("Fare well, warriors, and may you possess the strength to vanquish the evil beyond this doorway."); -- ??
		e.self:Say("The caverns rumble and shake violently as the third protective seals is broken"); -- ??
		-- quest::me("Fare well, warriors, and may you possess the strength to vanquish the evil beyond this doorway.");
		-- quest::me("The caverns rumble and shake violently as the third protective seals is broken");
		eq.depop();
	elseif(e.signal == 4) then -- Fail
		eq.signal(154129,5,20); -- depops grimlings
		eq.signal(154152,7,500); -- depops A Spiritual Arcanist V2
		eq.spawn2(154153,0,0,539.10,-374.98,-24.44,0); -- A Spiritual Arcanist Raid. West
		eq.depop();
	elseif(e.signal == 5) then
		eq.depop();
	end
end
