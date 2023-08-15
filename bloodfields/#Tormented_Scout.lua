-- items: 57014, 57052
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["beast_epic"] == "20") then
		e.self:Say("Get back, now. Dis a trick. Me can't control da . . . You must be [" .. eq.say_link("strong") .. "] for what coming. It know you here!");		
	elseif(e.message:findi("strong") and qglobals["beast_epic"] == "20" and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(301069)) then
		eq.spawn2(301069,0,0, 158,-321.4,-756.6,352); --#DDA
		e.self:Say("in an unknown tongue, 'Me so scspy. Me xannet stos dyf . . . It paek irntrpl of me!");
	end
end	

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 57014})) then
		e.other:SummonItem(57052);--Wrapped Gemmed Wand
		e.self:Emote("looks at you with sad eyes. 'Me so sorry, but me could not stop it. Wand is terrible power. Me wrap it again like Jillaa. You take it to Muada, quickly. Me tinks we did it! It has no power without dis wand!");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
