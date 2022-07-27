-- items: 13121, 13118
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why. hello there fellow scholar!  Don't you just love books?  I am quite a bookworm myself.  I could read forever!  I am currently working my way through the 'T's.");
	elseif(e.message:findi("erud's tonic")) then
		e.self:Say("Erud's Tonic! That is none of your concern!");
	elseif(e.message:findi("phloatin")) then
		e.self:Say("Phloatin Highbrow is my brother. He spends his time grogging it up."); 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13121})) then	-- Item: Innoruuk's Kiss of Death
		e.self:Say("It's about time you figured it out, genius! Maybe you should spend more time in the library. Here, take this tonic and get out of here before they see me giving it to you and turn us both inside out.");
		e.other:SummonItem(13118); -- Item: Erud's Tonic
		e.other:Ding();
		e.other:Faction(694,5,0); -- Faction: Erudite Citizen (Race)
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98036 -- Sinnkin_Highbrow
