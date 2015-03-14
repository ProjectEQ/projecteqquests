function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 3) then
		e.self:Say("When is Lomarc getting back from Odus? He was supposed to be back three nights ago. Have you heard anything?");
		eq.signal(2074,3);
	elseif(e.wp == 4) then
		e.self:Say("Hanns, you are not going to want to hear this, but one of our boys in Donovan's gang swears he saw Stanos in the Karanas a week ago. And we still haven't cornered Malka Rale.");
		eq.signal(2074, 4);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Ok, I'll send someone out to meet [Lomarc] behind the [Mermaid's Lure] tonight.");
	elseif(e.signal == 2) then
		e.self:Say("Very well, Father is as good as dead. Did I ever mention that I really hate family reunions? <chuckle>. I am gone!");
	end
end

-- END of FILE Zone:qeynos2  ID:2020 -- Renux_Herkanor