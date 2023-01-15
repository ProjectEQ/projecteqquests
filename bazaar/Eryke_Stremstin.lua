-- items: 48128, 1000, 48123
function event_say(e)
local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		e.self:Say("Hello there " .. e.other:GetName() .. ". I am sorry I have nothing to offer or trade since moving to these charming 'accommodations'.");
	elseif(qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "6" and e.message:findi("price")) then
		e.self:Say("I would be willing to part with the information and items for a meager amount of 1000 platinum pieces.");
	elseif(qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "6" and e.message:findi("polished")) then
		e.self:Say("You mean you haven't polished them yet. Must I teach you everything? You will need to polish each one by using some Divine Crystalline Glaze with your symbol in a kiln. Good luck and I wish you much success.");		
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	
	if(item_lib.check_turn_in(e.trade, {item1 = 48128})) then		
		e.self:Say("What's this? A note from Vortix. . .I have not made anything in a long while. I am afraid I cannot be of much use to you except to sell you the required materials. I suppose I could also 'guide' you by telling you what you need to make the garment yourself. . .but that's if the [" .. eq.say_link("price") .. "] is right.");	
		eq.set_global("monk_epic","6",5,"F");
	elseif(qglobals["monk_epic"] ~= nil and qglobals["monk_epic"] >= "6" and item_lib.check_turn_in(e.trade, {platinum = 1000})) then
		e.self:Say("Ah, very good then. What you will need to make your sash is the Celestial Thread I have handed you, as well as a Belt Pattern, and your three [" .. eq.say_link("polished") .. "] symbols in a sewing kit.");
		e.other:SummonItem(48123); -- Dirk of the Slickfinger
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- End of File
