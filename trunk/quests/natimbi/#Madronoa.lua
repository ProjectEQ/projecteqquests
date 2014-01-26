-- Sends players to Qvic after they have zoned in one time through Kodtaz
-- Once we implement level bypass (65) for Qvic, she will send anyone, no need to go to Kodtaz first.
-- #Madronoa NPCID: 280066
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetName() .. ", how are you today? My name is Madronoa and I have recently returned from the Prayer Grounds of Calling. A group of young adventurers such as yourself led me there some time ago. While there I learned of the geomantic barrier that prevents others from entering and I've learned how to channel the energy of that barrier to teleport those such as yourself there. However, you must have acquired the Fragment and Sliver of the High Temple to be able to get past the unseen force preventing adventurers from entering. If you have both of these pieces and [" .. eq.say_link("wish to travel") .. "] to Qvic, I shall create a portal for you.");
	elseif(e.message:findi("wish to travel")) then
		-- GM Bypass variable. it is set to true if the player has status > 80 and has #gm on
		local gm_bypass = false;
		if (e.other:Admin() > 80 and e.other:GetGM()) then
			gm_bypass = true;
		end
		-- load the current qglobals
		local qglobals = eq.get_qglobals(e.other);
		if (gm_bypass or (e.other:HasZoneFlag(295) and tonumber(qglobals["god_qvic_access"]) >= 2)) then
			-- send to safe spot in Qvic. Confirmed /loc on Live as of 2011/05/31
			e.other:MovePC(295,-124,-651,-422,0);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
