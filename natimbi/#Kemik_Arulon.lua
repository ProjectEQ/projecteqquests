-- items: 69953, 69969
local paladin_dz = {
	expedition = { name="Dranik's Hollows: Murkglider Hive", min_players=3, max_players=6 },
	instance   = { zone="dranikhollowsc", version=0, duration=eq.seconds("6h") },
	compass    = { zone="draniksscar", x=-2059.05, y=574.10, z=209.51 },
	safereturn = { zone="draniksscar", x=-2038.5, y=589.25, z=201.875, h=0 },
	zonein     = { x=3944.0, y=-252.0, z=138.0, h=380.0 }
}

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["paladin_epic"] == "9") then
		if(e.message:findi("hail")) then
			if(qglobals["paladin_epic_hollowc"] == "2") then			
				e.self:Say(e.other:GetName() .. "! I hear you have saved my sister Anetal! This is very good news indeed. You are truly a daring and compassionate knight. I do not have much to give you for a reward, but this might be valuable to you in your endeavors. Thank you again " .. e.other:GetName() .. ", and good luck to you, compassionate knight!");
				e.other:SummonItem(69953); --token of compassion
			elseif(qglobals["paladin_epic_hollowc"] == "1") then
				e.self:Say("Now, all that is left to be done is for you to find my sister Anetal in Discord. I have received reports that she is being held in an area called Dranik Hollows. When you are ready, bring these prayer beads with you, gather up a few of your friends, and return to me. I will see about opening up a passageway for you to find her.");
			else
				e.self:Say("Cough, cough, hello " .. e.other:GetName() .. ". I apologize for my cough, my sister and I were injured badly by Muramites in Discord when some of the initial Wayfarers ventured there to explore. I luckily escaped before being mortally injured, but I lost my sister in the exodus. I have been stricken with some odd disease that appears to be eating away at me everyday, and I fear there might not be anything that can cure me. However, maybe you can try to find a cure for me. I have heard a set of prayer beads might cleanse my body of this illness, which can be found in various holy temples throughout Norrath. Curing me might be hard to do, but someone in one of those temples might be willing to help.")
			end
		elseif(e.message:findi("ready")) then
			e.other:CreateExpedition(paladin_dz)
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 69969})) then
		e.other:Message(15,"As Kemik holds the prayer beads close to him, a blessing falls upon his body from the goddess Erollisi.");
		e.self:Say("Thank you " .. e.other:GetName() .. ". Praying with these beads has cured me of my sickness. Now, all that is left to be done is for you to find my sister Anetal in Discord. I have received reports that she is being held in an area called Dranik Hollows. When you are ready, bring these prayer beads with you, gather up a few of your friends, and return to me. I will see about opening up a passageway for you to find her.");
		e.other:SummonItem(69969);	--return prayer bead
		eq.set_global("paladin_epic_hollowc", "1", 5, "F");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end