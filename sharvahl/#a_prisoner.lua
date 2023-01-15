-- Rogue prequest event #Drogerin
-- items: 52008


function event_say(e)
	-- says nothing after you spawn him
end

function event_spawn(e)
	eq.set_timer("appearance",1000);
end
	

function event_trade(e)
    local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	
	if (e.other:Class() == "Rogue") then 
		if (item_lib.check_turn_in(e.trade, {item1 = 52008})) then -- shackle key
			eq.set_timer("depop",6000);
			e.self:SetAppearance(0);
			e.self:TempName("Nichols");
			e.self:QuestSay(e.other, "unlocks his manacles and stands up. As he dusts himself off and stretches out his limbs, he greets you, 'Well met " .. e.other:GetName() .. ". You have my thanks, but more importantly, I think you'll find that assisting our factions comes with great rewards.", {speak_mode = SpeakMode.Emote});
			e.other:Message(15, "You have freed Nichols, completing the second task for the Smuggler's Camp");
				if(qglobals["rog-nichols"] == nil) then
					eq.set_global("rog-nichols","1",5,"F"); --finished sharvahl prisoner quest
				end
		end
	end
end


function event_timer(e)
	
	if e.timer == "appearance" then
		e.self:SetAppearance(1);
		eq.stop_timer("appearance");
	elseif e.timer == "depop" then
		eq.stop_timer("depop");
		eq.depop();
	end
end
