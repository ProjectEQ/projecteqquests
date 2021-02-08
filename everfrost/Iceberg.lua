-- items: 12221, 12226
function event_spawn(e)
	eq.set_timer("follow",1000);
end

function event_timer(e)
	entity_list = eq.get_entity_list();

	if(e.timer == "follow") then
		local mobtypeID =  entity_list:GetMobByNpcTypeID(30061);
		local follow_mob = mobtypeID:GetID();
		eq.follow(follow_mob);
		eq.stop_timer("follow");
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Grrroarrr !!");
		eq.signal(30061,1); -- NPC: Tundra_Jack
	else
		eq.signal(30061,3); -- NPC: Tundra_Jack
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12221})) then
		e.self:Emote("growls with happiness and licks your face.  Just enough time to swipe the sweaty shirt from his collar!!  Iceberg then runs off to enjoy his lion delight!!");
		eq.signal(30061,2); -- NPC: Tundra_Jack
		e.other:SummonItem(12226); -- Item: Sweaty Shirt
		e.other:Ding();
		e.other:Faction(320,5,0); -- Faction: Wolves of the North
		e.other:Faction(327,5,0); -- Faction: Shamen of Justice
		e.other:Faction(328,5,0); -- Faction: Merchants of Halas
		e.other:Faction(311,5,0); -- Faction: Steel Warriors
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:everfrost  ID:30046 -- Iceberg 
