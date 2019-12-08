local followtarget;
local skip;

function event_spawn(e)
	followtarget = nil;
	skip = 0;
end

function event_aggro(e)
    e.self:Say("Guards! Guards! Help me!!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there " .. e.other:GetName() .. ". I don't suppose you can spare some coins? I'm just a poor halfling that is far away from home. I can't afford anything to eat or drink. Anything you can offer me will be of help.");
		if(followtarget == nil) then
			followtarget = e.other:GetID();
			e.self:SetAppearance(0); -- Stand
			eq.set_timer("follow",3000);
		end
	end
end

function event_trade(e) -- Note that we are intentionally accepting any trade
	local item_lib = require("items");
	
	if(followtarget == nil or e.other:GetID() == followtarget) then
		e.self:Say("Oh thank you. You are too kind to this poor halfling. Do you have anything else to give me?");
		e.self:SetAppearance(0); -- Stand
		followtarget = e.other:GetID();
		eq.set_timer("follow",3000);
	else
		item_lib.return_items(e.self, e.other, e.trade)
	end
end

function event_timer(e)
	if(e.timer == "follow" and eq.get_entity_list():GetClientByID(followtarget).valid and skip == 0) then
		eq.follow(followtarget); -- Follow the player who triggered the event
	else
		if(skip == 0) then
			skip = 1;
			eq.stop_follow();
			e.self:SetAppearance(3); -- lying
		elseif(skip == 1) then
			skip = 0;
			eq.stop_timer("follow");
			followtarget = nil;
			e.self:MoveTo(2407,1482,0,168,true);
		end
	end
end
