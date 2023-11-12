-- items: 21339, 21342, 21340, 21341
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("The gate is sealed, you see. But I know the way to reopen it. Wouldn't it be fun to call the Gatekeeper? Do you wish to help me [" .. eq.say_link("open the portal") .. "]?' ");
	elseif(e.message:findi("open the portal")) then
		e.self:Say("To beckon the Gatekeeper we must tempt him with bits of Doomfire. I have seen fragments of it leak through the cracks of the portal. It is here, in this place. Look around! Find the four bits and bring them to me. Ha ha! Hurry, hurry " .. e.other:GetRaceName() .. ". I cannot wait!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	local el = eq.get_entity_list();
	if (qglobals["Fatestealer_culth"] == "1" and not el:IsMobSpawnedByNpcTypeID(278005)) then
		if(item_lib.check_turn_in(e.trade, {item1 = 21339,item2=21342,item3=21340,item4=21341})) then 
			eq.spawn2(278005,0,0,-543,705,25,0); -- NPC: #Culthor_the_Gatekeeper
			e.self:Say("This should do the trick, I think! The gate is...Yes it's opening. Ha ha! The Gatekeeper comes!");
		end
	end;
  item_lib.return_items(e.self, e.other, e.trade);
end

