-- items: 18790, 13528, 13409, 13187, 5025
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18790)) then
		e.other:Message(15,"As your eyes adjust to the darkness, a large troll decked out in grimy metal armor turns towards you. 'I be Ranjor. You look weak now but mebbe me can make you strong! You read note in inventory and hand to me to start training!'");
	end
end

function event_say(e)
	local pfaction = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("Ya wanna be a member a Da Bashers. duz ya?  What making ya tink yooz is good nuff ta be one o' us?  Can ya proves ta me why I shouldn't oughtta just eat yer smelly hide?  I gonna tests ya. ya big. ugly peece o' meet.  Ya [willin ta test] or duz I just eats ya now?");
	elseif(pfaction > 5) then
		e.self:Say("I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
	elseif(pfaction > 4) then
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	elseif(e.message:findi("willin ta test")) then
		e.self:Say("Stoopid meat.  I gonna eats ya anyways sumday.  Brings me a froglok meat and two dem li'l froglok tadpole fleshes.  Dey berry good.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local pfaction = e.other:GetFaction(e.self);

	if (item_lib.check_turn_in(e.trade, {item1 = 18790})) then -- Tattered Note
		e.self:Say("Arhh.. Ranjor mighty warrior.. Ranjor teach you warrior.. you fight for Ranjor now.");
		e.other:Ding();
		e.other:SummonItem(13528);  -- Mud Covered Tunic
		e.other:Faction(235,100,0);  	-- Da Basher
		e.other:Faction(222,-15,0);  -- Broken Skull Clan
		e.other:AddEXP(100);
	elseif (pfaction > 4) then
		e.self:Say("You not friend.  Yuz take back.");
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13409, item2 = 13187, item3 = 13187})) then 
		e.self:Say("You is berry slow. Me too hungry. Me shood eats you for being slow. Gib me dat stuff. Here, take dis and git more stuff fer us. You much kllin, come backs sees me. I teeches ya hows ta kill bedder. Now git and kill stuff. We be Da Bashers fer a reesun.");
		e.other:Faction(235,5,0);  	-- Da Basher
		e.other:Faction(222,-1,0);  -- Broken Skull Clan
		e.other:Ding();
		e.other:SummonItem(5025); -- Item: Rusty Two Handed Battle Axe
	end

	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:grobb  ID:40024 -- Ranjor 
