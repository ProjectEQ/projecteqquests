--kithicor/Tarnamil.lua NPCID 20199
--SK Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["shadowknight_epic"] == "7") then
		e.self:Say("The paladins are coming from the west, my lord. The come to destroy the dead that walk at night. Already, the undead generals plot their demise, but they are powerful. They approach soon. I am getting out of here.");
		 eq.spawn2(20293 ,0,0,1774,708,210,112); --Uglib Gaibido
		 eq.spawn2(20294 ,0,0,1859,741,219,296); -- Xotmidd Ferlop
		 eq.spawn2(20295 ,0,0,1856,686,219,472); --Jarnig Kilanid
		 eq.spawn2(20298 ,0,0,1839,669,217,40); --Tilminos Farondi
		 eq.spawn2(20297 ,0,0,1872,700,221,384); --Shressa Farondi
		 eq.spawn2(20296 ,0,0,1819,731,215,216); --Valinda Ergington
		 eq.depop_with_timer();
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
	
	
