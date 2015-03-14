function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Well met, " .. e.other:GetName() .. "! I'm Kevan McPherson, the best darn smith in the north. Have ye come to purchase my finely crafted weapons or are ye wanting me ta teach ya the secrets of Northman smithing?");
	elseif (e.message:findi("kintok sent")) then
		e.self:Say("He did, did he? How is that fool doing? Its been a while since I saw him last! So, what has he sent you here for? Oh, a mold? I have a stockpile of those laying around. I suppose I could part with one if you were able to somehow get a fire goblin skin.");
	elseif (e.message:findi("northman kite shield")) then
		e.self:Say("To smith a Northman kite shield ye'll need a kite shield mold, a smithy hammer, a flask of water and a medium quality folded sheet metal. Remember ye'll have ta smith the metal sheet in a regular forge and finish the shield in our special Northman forge.");
	end
end


function event_trade(e)
	local item_lib = require("items");
	
	-- Fire Goblin Skin
	if(item_lib.check_turn_in(e.trade, {item1 = 2361})) then
		e.self:Say("Well, arent you full of surprises! I appreciate you retrieving this for me, as I cant really leave my shop here for very long, the services I provide are nearly irreplacable. As promised, here is your mold! Good luck!");
		e.other:AddEXP(500);
		e.other:SummonItem(51114); -- Shield Frame Mold
	end
	
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end