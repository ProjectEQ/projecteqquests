-- items: 17200
local ignoreplayer=0;
local ignoresay=0;

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["berserk_epic"] == "8" and e.message:findi("hail") and ignoresay==0) then
		if ignoreplayer==0 then
			e.self:DoAnim(27);
			e.self:Emote("ignores you and continues to move forward");
			e.self:MoveTo(-174.5, 497.5, -235.5, 64, true);
			eq.set_timer("warp",10000);
			ignoreplayer=1;
			ignoresay=1;
		else
			e.other:SummonItem(17200); --Julei's Twilight Pendant
			e.self:Say("Here take this back to Keras. This should be proof enough that I am fine. My thanks to you berserker. May you honor the path.");
			ignoreplayer=0;
			ignoresay=0;
		end
	end	
end

function event_timer(e)
	if e.timer=="warp" then
		eq.stop_timer("warp");
		e.self:GMMove(211,832,-893,0);
		e.self:MoveTo(211,832,-893,0, true);
		eq.set_timer("warpback",5*60*1000);
	elseif e.timer=="warpback" then
		eq.stop_timer("warpback");
		e.self:GMMove(-174.5, 497.5, -235.5, 384);
		e.self:MoveTo(-233.7, 486, -219.3, 29, true);
		ignoresay=0;
	end
end
