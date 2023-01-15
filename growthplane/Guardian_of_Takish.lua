-- items: 31427, 31430, 31429, 31428, 1209, 31432, 31434, 31431, 31433, 1223
function event_say(e)
	if(e.other:GetLevel() >= 55) then
		if(e.message:findi("hail")) then
			e.self:Say("Well met, " .. e.other:GetCleanName() .. ". It is indeed a wondrous day to be serving the lady Tunare. If you know of any templars or knights, send them to me.");
		elseif(e.message:findi("knight")) then
			e.self:Say("Fortune smile upon me this day. It seems that the great corrupter and the Prince of Hate have been spreading seeds of corruption within this continent. Will you assist us to stop them?");
		elseif(e.message:findi("assist")) then
			e.self:Say("Seek out the corrupter of life in the plane of hate and slay him. He has been reported performing dark rituals upon various wildlife within the Wakening Lands during the late hours of night. Return to me any evidence that you may find.");
		elseif(e.message:findi("templar")) then
			e.self:Say("I require your aid. It seems the agents of corruption have supplied the followers of the warbringer with four idols that will help defoliate the Wakening Lands. Will you aid me, noble Templar?");
		elseif(e.message:findi("aid")) then
			e.self:Say("Excellent. Gather the four idols that are held in Kael and return them to me. I will then properly dispose of these foul creations.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 31427,item2 = 31430,item3 = 31429,item4 = 31428}) and e.other:GetLevel() >= 55) then
		e.self:Say("May Tunare's blessing be upon thee! Here, take this item and use it wisely.");
		e.other:SummonItem(1209); -- Item: Natures Defender
    e.other:AddEXP(2500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 31432,item2 = 31434,item3 = 31431,item4 = 31433}) and e.other:GetLevel() >= 55) then
		e.self:Say("May Tunare's blessing be upon thee! Here, take this item and use it wisely.");
		e.other:SummonItem(1223); -- Item: Symbol of Tunarian Worship
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
