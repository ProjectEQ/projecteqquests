--Ikkinz Raid #1: Chambers of Righteousness   
function event_say(e)
	local el = eq.get_entity_list();
	if(e.message:findi("hail")) then

		if ( el:IsMobSpawnedByNpcTypeID(294574) == false and el:IsMobSpawnedByNpcTypeID(294575) == false and el:IsMobSpawnedByNpcTypeID(294339) == false and el:IsMobSpawnedByNpcTypeID(294338) == false and el:IsMobSpawnedByNpcTypeID(294341) == false) then
		e.self:Emote("can't see you nor does he know your name.  He blinks as he regards you as a trusik. 'You have made it through the trials of this sanctuary. The Guardian of Righteousness was my creation and will be forevermore. It is a ward against those who are not worthy and a test to those trusik priests who believe they can become the highest among priests -- the Vrex. You are most talented to have made it this far. Now, though, it is time for me to rest. I left something with my creations that you should have with you, correct? Hand it to me now.");
		else
		e.self:Say("You should not be here.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 60220})) then
		e.self:Say("Just as I expected you to do! Now I can finally rest and you will not be able to stop me!");
		eq.unique_spawn(294577, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --#Spirit_of_Tunik_Tamuik
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
