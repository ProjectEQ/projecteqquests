function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s. Thank you for stopping by. Had you heard I was looking for any and all information regarding the Tesch Val incursion? Perhaps you have come to help me gather knowledge? I seek the [Tesch Val scrolls]!",e.other:GetName()));
	elseif(e.message:findi("scrolls")) then
		e.self:Say("Oh good! I can add them to my collection. We are preparing to make books you know. Bring me any of the scrolls you find in the old Splitpaw lair, and I would be happy to reward you handsomely.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18504,item2 = 18505,item3 = 18506,item4 = 18507})) then
		local pp = math.random(6);
		local gp = math.random(20);
		local sp = math.random(60);
		local cp = math.random(100);
		e.self:Say(string.format("Why thank you, %s. If you do happen to come across any more of these, please bring them to me.",e.other:GetName()));
		e.other:SummonItem(12076);
		e.other:Ding();
		e.other:Faction(434,30,0);
		e.other:AddEXP(100);
		e.other:GiveCash(cp,sp,gp,pp);
	elseif(item_lib.check_turn_in(e.trade, {item1 = (18504 or 18505 or 18506 or 18507)})) then
		local pp = math.random(2);
		local gp = math.random(6);
		local sp = math.random(15);
		local cp = math.random(25);
		e.self:Say(string.format("Why thank you, %s. If you do happen to come across any more of these, please bring them to me.",e.other:GetName()));
		e.other:Ding();
		e.other:Faction(434,5,0);
		e.other:AddEXP(100);
		e.other:GiveCash(cp,sp,gp,pp);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
