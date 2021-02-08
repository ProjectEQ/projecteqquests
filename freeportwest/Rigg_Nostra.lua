-- items: 13903, 19931, 19929, 19930
function event_say(e)
	if(e.message:findi("crate of pickhead")) then
		e.self:Say("I've heard that a dwarf who calls himself Grendig and has not registered with the Coalition of Tradefolk has recently arrived in Freeport and is staying at the Freeport Inn just inside the South Gate. He has brought to Freeport pick heads from his home city of Kaladim. Find Grendig and 'convince' him to 'donate' a crate of pick heads to the Coalition of Tradefolk as tax for peddling his wares in our city.");
	elseif(e.message:findi("bundle of hardwood shafts")) then
		e.self:Say("There is a halfling named Jimble Woodentoe that occasionally visits Freeport to peddle his woodcrafts. He can be found traveling through the Commonlands from the direction of Rivervale. Find Jimble and 'convince' him to donate a bundle of hardwood shafts to the Coalition of Tradefolk as tax for peddling his wares in our city.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13903})) then
		e.self:Say("Excellent I've been waiting for the Coalition to send me some assistance. I have an associate waiting for some supplies that have not yet been collected. I need you to acquire a [crate of pick heads] and a [bundle of hardwood shafts] and bring them to me so that I may prepare them for delivery to my associate.");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 19931,item2 = 19929})) then
		e.self:Say(string.format("Thanks %s.  Now hand this crate to the fellow behind you.",e.other:GetName()));
		e.other:SummonItem(19930); -- Item: Large Crate of Mining Supplies
		e.other:Ding();
		eq.spawn2(383269,0,0,229,-153,-39,350); -- NPC: Orc_Centurion
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
