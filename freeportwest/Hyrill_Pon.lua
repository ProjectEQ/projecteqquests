function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want? Leave me be! Can't a man drown his sorrows in peace!?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:Class() == "Enchanter" or e.other:Class() == "Magician" or e.other:Class() == "Necromancer" or e.other:Class() == "Wizard") then
		if(item_lib.check_turn_in(e.trade, {item1 = 18010})) then -- Torn Parchment
			e.self:Say("Peh! He thinks this old skull he found is a legendary skull of Wun Toque. It is said, a wizard who possesses one is granted power and intelligence far beyond those of his peers. Yiz was searching for the skulls missing ruby eyes. It seems he found the location of the first eye. Hmm.. Lynuga.. Lynuga.. I think I have heard that name before.. Yeah! Now I remember. I met her in the Foreign Quarter of Neria.. um.. Highpass Hold. She was trying to hawk some stolen gems! I think she mumbled something about going home to Grobb. I sure don't have time to track her down.");
			e.other:Ding();
			e.other:Faction(51,3,0);
			e.other:Faction(105,3,0);
			e.other:Faction(184,3,0);
			e.other:Faction(258,3,0);
			e.other:Faction(0,0,0);
			e.other:AddEXP(1000);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Hyrill_Pon.pl