--butcher/Gridbar_Galund.lua NPCID 68234
--Warrior Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["warrior_epic"] >= "11") then
		e.self:Say("Hiya there. Oh me oh my, never mind. Huh? What can I do for ya? Er... wow, look at that bright... huh? I'm here! Hi! Are you looking for Gridbar? I think he's around here somewhere...");
	elseif(e.message:findi("Korbuk sent me") and qglobals["warrior_epic"] >= "11") then
		e.self:Say("Ooh, Korbuk. Big and important, yes. Gridbar should know what Korbuk wants. You say your name is Korbuk? Or did you say you were Gridbar? Huh? Who are you? Right, Korbuk. Did you bring the stones?");
	elseif(e.message:findi("gemming tool") and qglobals["warrior_epic"] >= "13") then
		e.self:Say("Yes, yes. Gemming tool. Very strong... huh? Korbuk wants a cookie? Where's Gridbar? Gridbar who? I know I'm a horse, so what? Huh? Right, tool. Need a flask of water... huh? Two high quality metal bits. Where's the beef? One gemming mold. Cook them in a forge, you got yourself a... what? Tool, gemming tool.");
	elseif(e.message:findi("spell called fire") and qglobals["warrior_epic"] >= "13") then
		e.self:Say("Can buy it from a... what? Wow! Look at the stars! What stars? Where's Korbuk? Who are you?! Buy from a shop. Someone has it. Not me. Maybe Gridbar.");	
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 60312, item2 = 60313, item3 = 60314, item4 = 60315}) and qglobals["warrior_epic"] >= "11") then --4x Stone of Eternal Power
		e.self:Say("Ah... huh? Oh, Gridbar says he needs a [gemming tool]. Who? What do you want? Something about Korbuk? Where's Gridbar? He says you need a [spell called Fire]. Huh? Gridbar who? No cookies for me now, thanks. Huh?");
		if(qglobals["warrior_epic"] < "12") then
			eq.set_global("warrior_epic","12",5,"F");
		end
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 60312, item2 = 60313}) and qglobals["warrior_epic"] >= "12") then --Gemming Tool and Spell:Fire
		e.self:Say("Oh, a hammer! No? Who are you? Where's Gridbar? I need a bottle of milk! No you don't. Gridbar says to eat some bread. Why? Huh? Give Gridbar the receptacle. What? The eye sockets! Give him the socket piece!");
		if(qglobals["warrior_epic"] < "13") then
			eq.set_global("warrior_epic","13",5,"F");
		end
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 60311}) and qglobals["warrior_epic"] >= "13") then --Glistening Hilt
		e.self:Say("Ooh, pretty. Huh? Gridbar likes it. Not me though, I think it's too bright. Who are you? What? Fine, I need some time with this. Gridbar does, not me. Who? He'll work on it, but I need you to... no wait, Gridbar needs you to do something for him. For me. For who? My sister is in Shadowhaven and needs a keg stamp. Give this to her for her brother. Who? Gridbar. That's me? Why?");
		e.other:SummonItem(60318); --Carved Keg Stamp
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 60319}) and qglobals["warrior_epic"] >= "13") then --Tube of Setting Solution
		e.self:Say("Nice, just what Gridbar needed. I needed. No he didn't. I want a sandwich. Gnome sandwich? Which sandwich is which? Aha! Genius! Who? This helps me finish the gem setting. Good good. Here's your socket piece. Gridbar likes it. Huh?");
		e.other:SummonItem(60320) --Hilt of Eternal Power
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	