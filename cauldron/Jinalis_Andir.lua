-- items: 11569, 28040, 28041, 28006
function event_say(e)
	if(e.message:findi("hail")) then
    e.self:Say("Let us dispense with pleasantries, "..e.other:GetName()..". I am Jinalis, as you know. I imagine you want to control the Elements. The Element of Water, which I possess, is the most powerful of the Elements. With it you can control the water which falls from the Air, erodes the Earth, and extinguishes Fire. It is a pity you do not focus on the Prime Element, but if you wish to follow that fool Magi'kot to your doom, I will not stop you. Bring me the Staff of Elemental Mastery: Water held by the last of the Kedge, the Tears of Erollisi held by a dirty and rotten officer across the Blessed Deep, and finally, the Rain of Karana, found on a mighty Giant in, where else, the Karanas.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 11569, item2 = 28040, item3 = 28041})) then
		e.self:Say("You have the control needed in order to manipulate the water which surrounds us. Take this Element and guard it well, you will need it in the times to come.");
		e.other:SummonItem(28006); -- Item: Element of Water
		e.other:Ding();
		e.other:AddEXP(3000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone: cauldron -- Jinalis_Andir

