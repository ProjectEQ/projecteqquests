local followtarget = nil;
local skip = false

function event_spawn(e)
	followtarget = nil;
	skip = false;
end

function event_aggro(e)
    e.self:Say("Guards! Guards! Help me!!");
end

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Hello there " .. e.other:GetName() .. ". I don't suppose you can spare some coins? I'm just a poor halfling that is far away from home. I can't afford anything to eat or drink. Anything you can offer me will be of help.");
		if followtarget == nil then
			followtarget = e.other:GetID();
			e.self:SetAppearance(0); -- Stand
			eq.set_timer("follow",3 * 1000);
		end
	end
end

function event_trade(e) -- Note that we are intentionally accepting any trade
	local item_lib = require("items");
	
	if followtarget == nil or e.other:GetID() == followtarget then
		e.self:Say("Oh thank you. You are too kind to this poor halfling. Do you have anything else to give me?");
		e.self:SetAppearance(0); -- Stand
		followtarget = e.other:GetID();
		eq.set_timer("follow",3 * 1000);
	else
		item_lib.return_items(e.self, e.other, e.trade)
	end
end

function event_timer(e)
	if e.timer == "follow" and eq.get_entity_list():GetClientByID(followtarget).valid and not skip then
		eq.follow(followtarget); -- Follow the player who triggered the event
	else
		if not skip then
			skip = true;
			eq.stop_follow();
			e.self:SetAppearance(3); -- lying
		elseif skip then
			skip = false;
			eq.stop_timer("follow");
			followtarget = nil;
			e.self:MoveTo(2407,1482,0,168,true);
		end
	end
end
