-- items: 31440, 31442, 31441, 31439, 1324
function event_say(e)
	if(e.other:GetLevel() >= 55) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, my friend. It is not often that we see strangers coming to this plane. I fear that our growing infestation problem has kept us busy as of late. The time for battle grows near yet we still do not have the offensive magics necessary to fend off our enemies.");
		elseif(e.message:findi("magic")) then
			e.self:Say("There are legends describing scrolls of ultimate power and enlightenment from fallen channelers that preserver the knowledge necessary for us to overcome our plight. Since these are just legends I cannot assure you that these scrolls exist, but at this point they are our only hope.");
		elseif(e.message:findi("scroll")) then
			e.self:Say("The ancient scrolls needed to complete the Tome that will aid us are found in Dragon Necropolis if the legends are true. The tome itself was made up of the incantations and the teachings of the great Lel`Farthok who was a mighty channeler for his time.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 31440,item2 = 31442,item3 = 31441,item4 = 31439}) and e.other:GetLevel() >= 55) then
		e.self:Say("Thank you, friend.  These scrolls will serve us well in the future.  Please take this as a sign of my gratitude."); -- Text made up
		e.other:SummonItem(1324); -- Item: Visage of Life
    e.other:AddEXP(2500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	entity_list = eq.get_entity_list();

	if(e.signal == 1) then
		local mobtypeID =  entity_list:GetMobByNpcTypeID(127098);
		local follow_mob = mobtypeID:GetID();
		eq.follow(follow_mob);
	elseif(e.signal == 2) then
		eq.stop_follow();
	end
end
