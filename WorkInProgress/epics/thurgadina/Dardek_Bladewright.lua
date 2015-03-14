--thurgadina/Dardek_Bladewright.lua NPCID 
--Warrior Prequest
function event_spawn(e)
	e.self:Say("Yeah, I'm Dardek. What d' ye want?! Can't ye see I'm not in t' mood fer talkin'? Bah, t' heck with ye. If'n ye get me a nice hot cup of m' favorite coffee, I might be willin' to talk with ye for a few minutes. Hurry up now, Coldain Coffee! It's t' only thing I'll drink!");	
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 60289}) and qglobals["warrior_pre"] == "4") then --Coldain Coffee Blend (brewed)
		e.self:Say("Mmm, nothing like a nice hot cup of Thurgadin's best. Alright then, let's head over t' my shop and we can get down t' business!");
		--needs to walk to new place here
		eq.set_global("warrior_pre","5",5,"F");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 20426, item2 = 60286, item3 = 60288}) and qglobals["warrior_pre"] == "5") then --Korbuk's Weapon Plans, Elegant Shank, and Emblazoned Champion's Hilt
		e.self:Say("Well now, looks like ye've done got yerself quite a selection there. Let me have a look at these things fer a minute.' Dardek works with the items in the forge briefly and then hands a completed sword to you. 'And there ye have it, your completed sword. Now if'n ye don't mind, I'm goin' t' head back and get some much needed sleep.");
		e.other:SummonItem(60292); --Dardek's Forged Blade
	end	
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	