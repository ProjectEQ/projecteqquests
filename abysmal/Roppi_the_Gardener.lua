function event_spawn(e)
	eq.set_proximity(e.self:GetX()-10,e.self:GetX()+10,e.self:GetY()-10,e.self:GetY()+10);
	eq.set_timer("banter", 5 * 60 * 1000); -- Emote every 5 minutes
end

function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Well hello!  I hope you enjoy our gardens.");
	end
end

function event_timer(e)
	if e.timer == "banter" then
		e.self:Emote(eq.ChooseRandom("stands up slowly, looking at his handiwork. 'That should do it. Now to get a little bit of water on those roots and we should have a fine crop of vegetables in a few months!","looks around at his garden and sighs heavily, before rising to his feet. 'These vegetables might not make it,' he says, shaking his head. 'I've fertilized the roots quite a bit. Hopefully, with a little water, these things should perk right up."));
	end
end

function event_waypoint_arrive(e)
	if e.wp % 2 == 0 then
		e.self:SetAppearance(4);
	elseif e.wp == 14 then
		e.self:Emote(" appears to take great pride in his garden, painstakingly caring for each individual plant.  He carefully moves outside the garden and begins to mumble an inaudible phrase.");
	end
end


function event_enter(e)
	e.self:Emote(eq.ChooseRandom("takes notice of the heavy footsteps upon the ground nearby. 'Please be careful walking around in my garden, these plants are very important to me.","looks up slowly at the figure standing amongst his plants. 'Would you mind not stepping on my plants, please? They are very difficult to keep alive without your bumbling feet destroying their leaves."));
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end