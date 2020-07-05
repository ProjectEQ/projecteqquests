-- items: 12140, 13383, 12226
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12140})) then
		e.other:SummonItem(13383); -- Item: Koalindl Fish
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12226})) then
		e.self:Emote("takes a whiff of the sweaty shirt and barks.");
		e.other:Ding();
		eq.set_timer("go",15000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	local bad_thief = eq.ChooseRandom(12190,12190,12190,12190,12190,12191);
	local random_x = eq.ChooseRandom(-3461,-3902,-4011);
	local random_y = eq.ChooseRandom(-1457,-3240,-1362);
	entity_list = eq.get_entity_list();
	
	if(e.timer == "go") then
		eq.stop_timer("go");
		eq.set_timer("depop",1200000);
		eq.unique_spawn(bad_thief,188,0,random_x,random_y,10,0);
		e.self:SetRunning(true);
		local mobtypeID =  entity_list:GetMobByNpcTypeID(bad_thief);
		local follow_mob = mobtypeID:GetID();
		eq.follow(follow_mob);
	elseif(e.timer == "depop") then
		eq.depop_with_timer();
	end
end

function event_signal(e)
	eq.stop_follow();
	e.self:SetRunning(false);
	eq.move_to(-2236,-3532,34,110);
	eq.stop_timer("depop");
end
