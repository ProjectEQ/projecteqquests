function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12620})) then
		e.self:Say("Tis good that Jinkus sent you with this poster. There has been talk of a Northman fugitive in the city. Take this list back to Jinkus so that our brethren in Halas are aware of the many criminals who have fled Qeynos and are still at large.");
		e.other:SummonItem(12622);
		e.other:Ding();
		e.other:Faction(15,20,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
